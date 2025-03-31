#!/bin/bash

# Create a temporary directory for processing
mkdir -p temp_android

# Create the main markdown file
cat > temp_android/android_exam.md << 'EOL'
# Android Development - Exam Reference Guide

## Table of Contents
1. [Android Fundamentals](#android-fundamentals)
2. [Android Architecture](#android-architecture)
3. [Android UI Development](#android-ui-development)
4. [Android Data Management](#android-data-management)
5. [Android Networking](#android-networking)
6. [Android Security](#android-security)
7. [Android Testing](#android-testing)
8. [Android Performance](#android-performance)

## Android Fundamentals

### Android Platform Architecture
| Layer | Components | Purpose |
|-------|------------|---------|
| Linux Kernel | Device drivers, memory management | Hardware abstraction |
| Hardware Abstraction Layer (HAL) | Camera, audio, sensors | Hardware interface |
| Android Runtime | ART, Dalvik VM | App execution |
| Native Libraries | OpenGL, SQLite, WebKit | Core functionality |
| Java API Framework | Activity Manager, Window Manager | App framework |
| System Apps | Phone, Contacts, Settings | Core apps |

### Android App Components
| Component | Purpose | Key Features |
|-----------|---------|--------------|
| Activity | UI screen | Lifecycle management |
| Fragment | UI portion | Reusable UI components |
| Service | Background tasks | Long-running operations |
| Broadcast Receiver | System events | Event handling |
| Content Provider | Data sharing | Data access layer |

### Android Manifest
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.app">
    
    <!-- Permissions -->
    <uses-permission android:name="android.permission.INTERNET" />
    
    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:theme="@style/AppTheme">
        
        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
```

## Android Architecture

### Android Architecture Components
| Component | Purpose | Key Features |
|-----------|---------|--------------|
| ViewModel | UI data management | Survives configuration changes |
| LiveData | Observable data holder | Lifecycle-aware |
| Room | Database abstraction | SQLite wrapper |
| WorkManager | Background work | Battery-optimized |
| Navigation | Screen navigation | Fragment-based |

### MVVM Architecture
```kotlin
// ViewModel
class UserViewModel : ViewModel() {
    private val _user = MutableLiveData<User>()
    val user: LiveData<User> = _user

    fun loadUser() {
        viewModelScope.launch {
            _user.value = userRepository.getUser()
        }
    }
}

// View
class UserActivity : AppCompatActivity() {
    private val viewModel: UserViewModel by viewModels()
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewModel.user.observe(this) { user ->
            // Update UI
        }
    }
}
```

## Android UI Development

### Layout Types
| Layout | Purpose | Key Features |
|--------|---------|--------------|
| LinearLayout | Sequential arrangement | orientation, weight |
| RelativeLayout | Relative positioning | above, below, toStartOf |
| ConstraintLayout | Flexible positioning | constraints, chains |
| FrameLayout | Stacking views | single child focus |
| GridLayout | Grid arrangement | columnCount, rowCount |

### Material Design Components
| Component | Purpose | Key Features |
|-----------|---------|--------------|
| AppBarLayout | Top app bar | elevation, scrolling |
| BottomNavigationView | Bottom navigation | menu items |
| CardView | Card container | elevation, corner radius |
| FloatingActionButton | Action button | elevation, anchor |
| Snackbar | Temporary message | duration, action |

### Custom Views
```kotlin
class CustomView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : View(context, attrs, defStyleAttr) {
    
    private val paint = Paint(Paint.ANTI_ALIAS_FLAG)
    
    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)
        // Custom drawing code
    }
    
    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        // Custom measurement logic
    }
}
```

## Android Data Management

### Room Database
```kotlin
@Entity(tableName = "users")
data class User(
    @PrimaryKey val id: Int,
    val name: String,
    val email: String
)

@Dao
interface UserDao {
    @Query("SELECT * FROM users")
    fun getAllUsers(): Flow<List<User>>
    
    @Insert
    suspend fun insertUser(user: User)
    
    @Update
    suspend fun updateUser(user: User)
    
    @Delete
    suspend fun deleteUser(user: User)
}

@Database(entities = [User::class], version = 1)
abstract class AppDatabase : RoomDatabase() {
    abstract fun userDao(): UserDao
}
```

### SharedPreferences
```kotlin
class PreferencesManager(context: Context) {
    private val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    
    fun saveString(key: String, value: String) {
        prefs.edit().putString(key, value).apply()
    }
    
    fun getString(key: String, defaultValue: String): String {
        return prefs.getString(key, defaultValue) ?: defaultValue
    }
}
```

## Android Networking

### Retrofit API Client
```kotlin
interface ApiService {
    @GET("users")
    suspend fun getUsers(): Response<List<User>>
    
    @POST("users")
    suspend fun createUser(@Body user: User): Response<User>
}

object RetrofitClient {
    private const val BASE_URL = "https://api.example.com/"
    
    private val retrofit = Retrofit.Builder()
        .baseUrl(BASE_URL)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        
    val apiService: ApiService = retrofit.create(ApiService::class.java)
}
```

### Coroutines for Async Operations
```kotlin
class UserRepository {
    suspend fun fetchUsers(): List<User> = withContext(Dispatchers.IO) {
        try {
            val response = apiService.getUsers()
            if (response.isSuccessful) {
                response.body() ?: emptyList()
            } else {
                throw Exception("Network error")
            }
        } catch (e: Exception) {
            // Handle error
            emptyList()
        }
    }
}
```

## Android Security

### Data Encryption
```kotlin
class SecurityManager {
    private val keyStore = KeyStore.getInstance("AndroidKeyStore")
    private val cipher = Cipher.getInstance(TRANSFORMATION)
    
    fun encrypt(data: String): String {
        val key = getOrCreateKey()
        cipher.init(Cipher.ENCRYPT_MODE, key)
        val encrypted = cipher.doFinal(data.toByteArray())
        return Base64.encodeToString(encrypted, Base64.DEFAULT)
    }
    
    fun decrypt(encryptedData: String): String {
        val key = getOrCreateKey()
        cipher.init(Cipher.DECRYPT_MODE, key)
        val decoded = Base64.decode(encryptedData, Base64.DEFAULT)
        return String(cipher.doFinal(decoded))
    }
}
```

### Biometric Authentication
```kotlin
class BiometricManager(private val context: Context) {
    private val biometricPrompt = BiometricPrompt(
        context as FragmentActivity,
        object : BiometricPrompt.AuthenticationCallback() {
            override fun onAuthenticationSucceeded(result: BiometricPrompt.AuthenticationResult) {
                super.onAuthenticationSucceeded(result)
                // Handle success
            }
        }
    )
    
    fun authenticate() {
        val promptInfo = BiometricPrompt.PromptInfo.Builder()
            .setTitle("Authenticate")
            .setSubtitle("Use biometric to authenticate")
            .setNegativeButtonText("Cancel")
            .build()
            
        biometricPrompt.authenticate(promptInfo)
    }
}
```

## Android Testing

### Unit Testing
```kotlin
class UserViewModelTest {
    private lateinit var viewModel: UserViewModel
    private lateinit var repository: FakeUserRepository
    
    @Before
    fun setup() {
        repository = FakeUserRepository()
        viewModel = UserViewModel(repository)
    }
    
    @Test
    fun `loadUser updates LiveData`() = runTest {
        // Given
        val user = User(1, "John", "john@example.com")
        repository.addUser(user)
        
        // When
        viewModel.loadUser()
        
        // Then
        assertEquals(user, viewModel.user.value)
    }
}
```

### UI Testing
```kotlin
@RunWith(AndroidJUnit4::class)
class MainActivityTest {
    @get:Rule
    val activityRule = ActivityScenarioRule(MainActivity::class.java)
    
    @Test
    fun testUserDisplay() {
        // Given
        val user = User(1, "John", "john@example.com")
        
        // When
        onView(withId(R.id.userName))
            .check(matches(withText("John")))
            
        // Then
        onView(withId(R.id.userEmail))
            .check(matches(withText("john@example.com")))
    }
}
```

## Android Performance

### Memory Management
```kotlin
class ImageLoader {
    private val memoryCache = LruCache<String, Bitmap>(
        (Runtime.getRuntime().maxMemory() / 1024 / 8).toInt()
    )
    
    fun loadImage(url: String, imageView: ImageView) {
        // Check memory cache
        memoryCache.get(url)?.let { bitmap ->
            imageView.setImageBitmap(bitmap)
            return
        }
        
        // Load from network
        CoroutineScope(Dispatchers.IO).launch {
            val bitmap = downloadImage(url)
            withContext(Dispatchers.Main) {
                memoryCache.put(url, bitmap)
                imageView.setImageBitmap(bitmap)
            }
        }
    }
}
```

### Network Optimization
```kotlin
class NetworkManager {
    private val okHttpClient = OkHttpClient.Builder()
        .addInterceptor(HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BODY
        })
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .writeTimeout(30, TimeUnit.SECONDS)
        .build()
        
    private val retrofit = Retrofit.Builder()
        .baseUrl(BASE_URL)
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
}
```

## Quick Reference Guide

### Common Pitfalls
1. **Memory Leaks**
   - Unregistered observers
   - Static references
   - Anonymous inner classes

2. **UI Thread Blocking**
   - Heavy operations on main thread
   - Network calls without coroutines
   - Database operations without Room

3. **Configuration Changes**
   - Not handling state restoration
   - Missing ViewModel usage
   - Improper fragment management

### Best Practices
1. **Code Organization**
   - Clean Architecture
   - MVVM pattern
   - Repository pattern

2. **Performance**
   - ViewHolder pattern
   - Image caching
   - Lazy loading

3. **Testing**
   - Unit tests
   - UI tests
   - Integration tests

EOL

# Convert markdown to PDF with proper styling
pandoc temp_android/android_exam.md \
    --pdf-engine=wkhtmltopdf \
    --standalone \
    --toc \
    --toc-depth=3 \
    --highlight-style=tango \
    --variable=geometry:margin=1in \
    --variable=documentclass:article \
    --variable=fontsize:11pt \
    --variable=mainfont:DejaVuSerif \
    --variable=monofont:DejaVuSansMono \
    -o Android_Development_Exam_Reference.pdf

# Clean up
rm -rf temp_android

echo "PDF generation complete! Check Android_Development_Exam_Reference.pdf" 