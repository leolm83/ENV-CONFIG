# Verificar se o arquivo de perfil existe 
if (-not (Test-Path $PROFILE)) { 
    # Criar o arquivo de perfil se não existir 
    Write-Output "Arquivo Profile do PowerShell nao encontrado, criando um" 
    New-Item  -type 'file' -Force  -Path $PROFILE 
    Write-Output "Arquivo profile criado" 
} 
# Verificar se o alias já está no perfil 


# criacao de uma funcao que funcione de forma similar ao comando touch(comum em sistemas unix)
$touch = 'function touch([string]$name,[string]$path)
{
    if (-not $path) {
        # se o path nao for passado, ele pega o local atual
        $path = (Get-Location).Path
    }
    if($name){
    $caminhoArquivo = $path+"/"+$name 
    New-Item -Path $caminhoArquivo -ItemType File -Force
    }
}'

$profileContent = Get-Content $PROFILE 

if ($profileContent -notcontains $touch) { 
    # Adicionar o alias 'touch' ao perfil existente 
    Add-Content -Path $PROFILE -Value "`n$touch" 
    Write-Output "Alias 'touch' adicionado ao perfil" 
}else{
    Write-Output "O Alias ja existe, nada será alterado" 
}

Start-Sleep -Seconds 10
