# puTTY-CAC-Chocolatey
Chocolatey package specification for puTTY CAC

#How to build?
- Build the package
Navigate to package directory
`choco pack`
- Test the package
Testing should probably be done on a Virtual Machine
In your package directory, use:
`choco install putty-cac -s .`
- Push the package to the Chocolatey community package repository:
Copy the API key from your Chocolatey account.
choco apikey -k [API_KEY_HERE] -source https://push.chocolatey.org/
choco push putty-cac.m.n.o.nupkg -s https://push.chocolatey.org/ - nupkg file can be ommitted if it is the only one in the directory.

Details under: https://chocolatey.org/docs/create-packages-quick-start