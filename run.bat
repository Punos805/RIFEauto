mkdir input_frames
mkdir output_frames

ffprobe input.mp4
ffmpeg -i input.mp4 -vn -acodec copy audio.m4a
ffmpeg -i input.mp4 input_frames/frame_%08d.png

./rife-ncnn-vulkan -i input_frames -o output_frames
ffmpeg -framerate 48 -i output_frames/%08d.png -i audio.m4a -c:a copy -crf 20 -c:v libx264 -pix_fmt yuv420p output.mp4

:::This is 100% bat script, so source code is in the release file.
