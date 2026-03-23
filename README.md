# Transcribe

A containerized CLI tool for transcribing audio files with speaker diarization using NVIDIA's Parakeet CTC 1.1B model. All dependencies (Python, ffmpeg, nvidia-riva-client) are prepackaged in the Docker image.

## Setup

1. Get an API key from [build.nvidia.com](https://build.nvidia.com)

2. Set the environment variable:
   ```bash
   export NVIDIA_API_KEY="your-key-here"
   ```

3. Build the Docker image:
   ```bash
   docker build -t transcribe .
   ```

## Usage

```bash
# Transcribe a single file (from current directory)
docker run --rm -e NVIDIA_API_KEY -v "$(pwd):/data" transcribe recording.wav

# Transcribe all audio files in a folder
docker run --rm -e NVIDIA_API_KEY -v "$(pwd):/data" transcribe ./my-recordings/
```

Output `.txt` files are created alongside the input audio files with the same name.

### Shell alias (optional)

Add this to your `.bashrc` / `.zshrc` for convenience:
```bash
alias transcribe='docker run --rm -e NVIDIA_API_KEY -v "$(pwd):/data" transcribe'
```

Then just:
```bash
transcribe recording.wav
transcribe ./my-recordings/
```

## Supported Formats

wav, flac, ogg, opus, mp3, m4a, wma, aac, webm

## Output Format

```
[Speaker 1]
Hello, welcome to the meeting today.

[Speaker 2]
Thanks for having me, let's get started.
```

## Model

Uses [Parakeet CTC 1.1B](https://build.nvidia.com/nvidia/parakeet-ctc-1_1b-asr) with Sortformer speaker diarization via NVIDIA's cloud API.
