# Readme

* move files to /etc/systemd/system and change owner to root.
```bash
sudo cp nightly-shutdown.service /etc/systemd/system/ && \
sudo cp nightly-shutdown.timer /etc/systemd/system/ && \
sudo chown root:root /etc/systemd/system/nightly-shutdown.service && \
sudo chown root:root /etc/systemd/system/nightly-shutdown.timer
```


* Enable and start the timer.
```bash
Sudo systemctl enable --now nightly-shutdown.timer
```
