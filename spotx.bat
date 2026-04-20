@echo off

echo Installing Spotify from local file...
start /wait "" "G:\Check\spotify_installer-1.2.86.502.g8cd7fb22-x64.exe"

set param=-new_theme -block_update_on
set url='https://raw.githubusercontent.com/SpotX-Official/SpotX/refs/heads/main/run.ps1'
set url2='https://spotx-official.github.io/SpotX/run.ps1'
set tls=[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12;

echo Applying SpotX patch...
%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command %tls% $p='%param%'; """ & { $(try { iwr -useb %url% } catch { $p+= ' -m'; iwr -useb %url2% })} $p """" | iex

echo Patch applied successfully!
pause
exit /b
