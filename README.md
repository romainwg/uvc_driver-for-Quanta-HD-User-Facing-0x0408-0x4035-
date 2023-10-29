# uvc_driver for Quanta HD User Facing (0x0408-0x4035)

This project is a fork of [Giuliano69/uvc_driver-for-Quanta-HD-User-Facing-0x0408-0x4035-](https://github.com/Giuliano69/uvc_driver-for-Quanta-HD-User-Facing-0x0408-0x4035-).

It provides a solution to install the webcam driver for ACER laptops, such as the Acer Nitro AN515-58, that use the Quanta HD User Facing camera with the device ID `0x0408-0x4035`.

To check if your laptop uses the same camera, you can run the following command:

```bash
lsusb | grep "0408:4035 Quanta Computer, Inc. ACER HD User Facing"
```

## Installation

Follow these steps to install the driver:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/romainwg/uvc_driver-for-Quanta-HD-User-Facing-0x0408-0x4035-.git
   ```

2. **Navigate to the project folder**:
   ```bash
   cd uvc_driver-for-Quanta-HD-User-Facing-0x0408-0x4035-
   ```

3. **Give execution permissions to the script**:
   ```bash
   chmod +x compile_module.sh
   ```

4. **Run the script**:
   ```bash
   ./compile_module.sh
   ```

After following these steps, the driver should be installed and operational for your Quanta HD User Facing camera.

## Contributions

Contributions and improvements are welcome. If you find bugs or have suggestions, please feel free to open an issue or a pull request.

## Acknowledgements

A special thanks to [Giuliano69](https://github.com/Giuliano69) for the initial groundwork on this driver.

Additionally, appreciation goes to [REASY](https://github.com/REASY) for providing a crucial patch, ensuring its smooth operation on newer kernels.

You can find the details of the patch [here](https://github.com/Giuliano69/uvc_driver-for-Quanta-HD-User-Facing-0x0408-0x4035-/issues/3#issuecomment-1715009720).
