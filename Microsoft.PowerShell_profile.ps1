Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG= "C:\ProgramData\chocolatey\lib\starship\config\starship.toml"

Import-Module Terminal-Icons

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key "Tab" -Function MenuComplete
Set-PSReadlineKeyHandler -Key "UpArrow" -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key "DownArrow" -Function HistorySearchForward
Set-PSReadLineOption -Colors @{ InlinePrediction = '#898c5b'}
Set-PSReadlineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key "RightArrow" -ScriptBlock {
       param($key, $arg)

       $line = $null
       $cursor = $null
       [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

       if ($cursor -lt $line.Length) {
           [Microsoft.PowerShell.PSConsoleReadLine]::ForwardChar($key, $arg)
       } else {
           [Microsoft.PowerShell.PSConsoleReadLine]::AcceptNextSuggestionWord($key, $arg)
       }
}

Set-PSReadLineKeyHandler -Key End -ScriptBlock {
       param($key, $arg)

       $line = $null
       $cursor = $null
       [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

       if ($cursor -lt $line.Length) {
           [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine($key, $arg)
       } else {
           [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion($key, $arg)
       }
}

Set-PSReadLineOption -Colors @{
    "Parameter" = "#717C7C"
}

$env:FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '
$env:FZF_DEFAULT_OPTS='--layout=reverse --border --inline-info --color=bg+:-1,bg:-1,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'
function v {
    # $file = $(fzf --preview 'bat --style numbers,changes --color=always {} | head 500')
    $file = $(fzf --preview 'bat --style numbers,changes --color=always {}')
    nvim $file
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function which ($command){
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
    }

Set-Alias lg lazygit
Set-Alias _ sudo

function lt() {lsd --tree}

function l() {lsd -Al --timesort --date +'MM/dd/yyyy HH:mm:ss'}
function ..() {cd ..}
function ...() {cd ..\..}
function ....() {cd ..\..\..}
