import subprocess

def main():
    docker = subprocess.check_output(['systemctl','status','docker'])
    if 'running' in docker.decode('utf-8'):
        print('')


if __name__ == "__main__":
    main()