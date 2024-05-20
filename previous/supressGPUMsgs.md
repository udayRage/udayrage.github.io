# [Main Menu](index.html)

Please use the following code to supress the GPU messages



    gpu_devices = tf.config.experimental.list_physical_devices('GPU')
    for device in gpu_devices:
        tf.config.experimental.set_memory_growth(device, True)