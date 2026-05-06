$dir = "images\posters"
New-Item -ItemType Directory -Force -Path $dir | Out-Null

$posters = @(
    @{ name = "concrete-utopia.jpg";    url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/695148256.jpg?1725036222" },
    @{ name = "the-village.jpg";        url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/943427223.jpg?1631288331" },
    @{ name = "arrival.jpg";            url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/961807760.jpg?1631722707" },
    @{ name = "children-of-men.jpg";    url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/515701742.jpg?1631722609" },
    @{ name = "eye-in-the-sky.jpg";     url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/800466320.jpg?1631722648" },
    @{ name = "the-prestige.jpg";       url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/936057951.jpg?1631722704" },
    @{ name = "district-9.jpg";         url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/891810675.jpg?1632323369" },
    @{ name = "gattaca.png";            url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/262909853.png?1632323409" },
    @{ name = "the-truman-show.jpg";    url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/213017504.jpg?1632323641" },
    @{ name = "the-farewell.jpg";       url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/987442572.jpg?1632323908" },
    @{ name = "the-matrix.jpg";         url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/473750016.jpg?1632323940" },
    @{ name = "eeaao.png";              url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/published/592912544.png?1670008180" },
    @{ name = "black-mirror.jpg";       url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/921005818.jpg?1632323993" },
    @{ name = "after-yang.jpg";         url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/295916892.jpg?1662141025" },
    @{ name = "minority-report.jpg";    url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/editor/326191438.jpg?1632323876" },
    @{ name = "parental-advisory.jpg";  url = "https://outofkantrol.weebly.com/uploads/1/5/8/7/15876062/published/230216415.jpg?1670010739" }
)

foreach ($poster in $posters) {
    $dest = Join-Path $dir $poster.name
    Write-Host "Downloading $($poster.name)..."
    Invoke-WebRequest -Uri $poster.url -OutFile $dest -UseBasicParsing
}

Write-Host "`nAll $($posters.Count) posters downloaded to .\$dir"
