(
{
    var input, noise, chainInput, chainNoise, chainOut, output;

    // Capture sound input from the default input device
    input = SoundIn.ar(0);

    // Generate white noise
    noise = WhiteNoise.ar(1);

    // Perform FFT on the input sound
    chainInput = FFT(LocalBuf(2048), input);

    // Perform FFT on the white noise
    chainNoise = FFT(LocalBuf(2048), noise);

    // Subtract the magnitude spectrum of the input sound from the white noise
    chainOut = PV_MagSubtr(chainNoise, chainInput);

    // Convert back to time domain
    output = IFFT(chainOut);

    // Output the result in stereo
    Out.ar(0, output ! 2);
}.play;
)