import subprocess

def main():
    steam = subprocess.check_output(['pgrep','steam'])
    if steam.decode('utf-8'):
        print('')


if __name__ == "__main__":
    main()

