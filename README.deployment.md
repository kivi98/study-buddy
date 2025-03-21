# Markdown Notes Viewer Deployment

This document provides instructions for deploying the Markdown Notes Viewer application to Render.

## Deployment Steps

### 1. Push your code to GitHub

Make sure your code is in a GitHub repository. Render can deploy directly from GitHub.

### 2. Sign up for Render

1. Go to [render.com](https://render.com/) and sign up for an account
2. Verify your email and log in

### 3. Create a new Web Service

1. Click "New +" in the top right corner of the dashboard
2. Select "Web Service"
3. Connect your GitHub repository
4. Find and select your markdown-viewer repository

### 4. Configure your Web Service

Use these settings:
- **Name**: markdown-notes-viewer (or any name you prefer)
- **Environment**: Python 3
- **Region**: Choose the region closest to your users
- **Branch**: main (or your default branch)
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `gunicorn app:app`
- **Plan**: Free (or select a paid plan if you need more resources)

### 5. Deploy

1. Click "Create Web Service"
2. Render will automatically build and deploy your application
3. When deployment is complete, you'll see a URL where your app is accessible

### 6. Environment Variables (if needed)

If you need to set any environment variables:
1. Go to your web service dashboard
2. Click "Environment" in the left sidebar
3. Add key-value pairs as needed
4. Click "Save Changes" and your service will be redeployed

## Troubleshooting

If you encounter issues during deployment:
1. Check the build logs in the Render dashboard
2. Ensure all dependencies are properly listed in requirements.txt
3. Verify that the start command is correct
4. Check for any syntax errors in your application

## Updating Your Application

To update your deployed application:
1. Push changes to your GitHub repository
2. Render will automatically detect the changes and redeploy 