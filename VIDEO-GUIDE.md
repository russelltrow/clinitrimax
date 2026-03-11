# How to Add YouTube Videos for Each Destination

The Marvel Cruise Tracker now includes a video section in "Today's Mission Report" that automatically displays YouTube videos based on the current destination!

## How to Update Videos

### Step 1: Find YouTube Videos
Search YouTube for videos about each destination. Good search terms:
- "Bonaire travel guide kids"
- "Barbados beaches family friendly"
- "Curacao colorful houses tour"
- "Jamaica Dunn's River Falls"
- etc.

### Step 2: Get the Video ID
From a YouTube URL like: `https://www.youtube.com/watch?v=ABC123xyz`

The video ID is the part after `v=`: **ABC123xyz**

### Step 3: Update the Code
Open `index.html` and find the `destinationVideos` object (around line 1453).

Replace the placeholder `'dQw4w9WgXcQ'` with your actual video IDs:

```javascript
const destinationVideos = {
  'Barbados': 'x3BLmksuxoM',
  'Bonaire': 'x3BLmksuxoM',
  'Curaçao': 'oDVkHEILTi4',
  'Aruba': '9OTecjGzMjg',
  'Jamaica': '_HPpuozyvAw',
  'Grand Turk': 'kVJMLH3eXdI',  // ✅ Updated!
  'Antigua': 'YOUR_VIDEO_ID_HERE',
  'Dominica': 'YOUR_VIDEO_ID_HERE'
};
```

### Step 4: Save and Refresh
Save the `index.html` file and refresh the page in your browser!

## How It Works
- **When at a port**: Shows video of the current location (e.g., "🎬 Watch a video about Bonaire!")
- **When at sea**: Shows video of the next destination (e.g., "🎬 Get ready for Bonaire! 🦩")
- Videos automatically change based on the cruise day

## Tips
- Choose short videos (3-8 minutes) that are kid-friendly
- Look for videos with nice visuals of beaches, animals, and landmarks
- Test each video to make sure it plays correctly

## Example
If you find this video: `https://www.youtube.com/watch?v=dQw4w9WgXcQ`

Update the code like this:
```javascript
'Bonaire': 'dQw4w9WgXcQ',
```
