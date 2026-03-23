# Transcribe

A simple CLI tool for transcribing audio files with speaker diarization using NVIDIA's Parakeet CTC 1.1B model.

## Setup

1. Get an API key from [build.nvidia.com](https://build.nvidia.com)

2. Set the environment variable:
   ```bash
   export NVIDIA_API_KEY="your-key-here"
   ```

3. Install Python dependency (auto-installed on first run, or manually):
   ```bash
   pip3 install nvidia-riva-client
   ```

## Usage

```bash
# Transcribe a single file
./transcribe recording.wav

# Transcribe all audio files in a folder
./transcribe ./my-recordings/
```

Output `.txt` files are created alongside the input audio files with the same name.

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
