CHECK_INCLUDE_FILE (alsa/asoundlib.h HAVE_ALSA_ASOUNDLIB_H)
CHECK_LIBRARY_EXISTS (asound snd_pcm_open "" HAVE_SND_PCM_OPEN)
IF (NOT HAVE_ALSA_ASOUNDLIB_H OR NOT HAVE_SND_PCM_OPEN)
    PLUGIN_DISABLE ()
ENDIF ()
