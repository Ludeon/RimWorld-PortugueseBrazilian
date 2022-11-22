<#
	.SINOPSE
	Este script se encarrega de instalar/atualizar as traduções mais recentes.
	.DESCRIÇÃO
	Este script se encarrega de instalar/atualizar as traduções do jogo para as traduções mais recentes disponíveis para tradução ao português (brasileiro) diretamente dos repositórios oficiais.
	
	Desenvolvido originalmente por Xeros08 (Aser Granado Amores).

	.FUNCIONALIDADE
	Para usar este script, certifique-se de colocá-lo dentro do diretório do jogo, próximo ao executável do jogo, a pasta "Mods" e a pasta "Data".
#>


# Variáveis para usar
$repo_owner = "Ludeon"
$official_repo = "RimWorld-PortugueseBrazilian"
$branch = "master"

$ingame_name = "PortugueseBrazilian (Português Brasileiro)"


# Declarações de função


function DownloadGithubRepo {
	<#
		.SINOPSE
		Baixa o repositório do Github indicado.

		.DESCRIÇÃO
		Baixa o repositório do Github indicado como um zip e o extrai/descompacta.
		Quando terminar, exclua o zip para economizar espaço.

		.PARÂMETRO Owner
		Especifica o proprietário do repositório.

		.PARÂMETRO Repo 
		Especifica o repositório.
		
		.PARÂMETRO Branch
		Especifique o branch para fazer o download. Por padrão, é o "master".
	#>

	param(
		[Parameter(Mandatory=$True)] 
		[string]$Owner,

		[Parameter(Mandatory=$True)] 
		[string]$Repo,

		[Parameter(Mandatory=$False)] 
		[string]$Branch = "master"
	)

	# Cria o link de download para o repo usando a API REST do GitHub
	$repo_url = "https://api.github.com/repos/$Owner/$Repo/zipball/$Branch"

	# Cria o arquivo zip
	$zip_file = ".\$Owner-$Repo-$Branch.zip"
	New-Item $zip_file -ItemType File -Force

	# Baixa o repositório
	Invoke-RestMethod -Uri $repo_url -OutFile $zip_file

	# Extrai o arquivo zip
	Expand-Archive -Path $zip_file -DestinationPath ".\" -Force
	Remove-Item -Path $zip_file -Force
}


function UpdateContent {
	<#
		.SINOPSE
		Atualiza as traduções do conteúdo oficial indicado.

		.DESCRIÇÃO
		Exclui as traduções baixadas anteriormente (se houver) e copia as novas do repositório local.

		.PARÂMETRO LocalRepo 
		Caminho para o repositório local do qual você deseja importar as traduções deste conteúdo.
		
		.PARÂMETRO Name
		Especifica o conteúdo oficial para o qual atualizar as traduções.

		.EXAMPLO
		UpdateContent -LocalRepo "Ludeon-RimWorld-PortugueseBrazilian" -Name "Core"

	#>
	param (
		[Parameter(Mandatory=$True)] 
		[string]$LocalRepo,

		[Parameter(Mandatory=$True)] 
		[string]$Name
	)

	# Cria o caminho para a pasta de idiomas desse conteúdo
	$translations_folder = ".\Data\$Name\Languages"
	if (!(Test-Path $translations_folder)) { return } # Se você não tem o conteúdo ou ele não existe, pule.

	# Se o .tar antigo estiver presente, remova-o
	if (Test-Path "$translations_folder\$ingame_name.tar") {
		Remove-Item "$translations_folder\$ingame_name.tar" -Force
	}

	# Se houver arquivos de tradução antigos, remova-os
	if (Test-Path "$translations_folder\$ingame_name") {
		Remove-Item "$translations_folder\$ingame_name" -Force -Recurse
	}

	# Copia as novas traduções
	Copy-Item -Path ".\$LocalRepo\$Name" -Destination "$translations_folder\$ingame_name" -Recurse
}




# Ponto de Entrada do Script

DownloadGithubRepo -Owner $repo_owner -Repo $official_repo -Branch $branch

# Renomear do diretório do repositório para corresponder ao formato (owner-repo)
$local_repo = "$repo_owner-$official_repo"
Get-ChildItem -Name -Directory ".\" -Filter "$local_repo*" | Select-Object -First 1 | Rename-Item -NewName $local_repo -Force

# Atualiza os arquivos de tradução do jogo com aqueles do repositório baixado
UpdateContent -LocalRepo $local_repo -Name "Core"
UpdateContent -LocalRepo $local_repo -Name "Royalty"
UpdateContent -LocalRepo $local_repo -Name "Ideology"
UpdateContent -LocalRepo $local_repo -Name "Biotech"

# Exclui o repositório baixado
Remove-Item -Recurse -Force ".\$local_repo"
