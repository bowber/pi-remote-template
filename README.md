# PI Template Remote Development

=============================
This is a template for remote development using the Raspberry Pi.

## Prerequisites

- Raspberry Pi with SSH enabled
- GCC on the Raspberry Pi, **if not installed**, ssh into the Raspberry Pi and install it using the following command:
  - `sudo apt-get install build-essential`
- WiringPi on the Raspberry Pi and Development machine (if you need it).
- Development machine with Ubuntu installed some packages, **if not installed**, install them using the following commands:
  - ssh: `sudo apt-get install openssh-client`
  - rsync: `sudo apt-get install rsync`
- sshpass: `sudo apt-get install sshpass`

## Usage

```bash
./run.sh
```

### Configuration

Change variables in `run.sh` to match your configuration. More information can be found in `run.sh`.
