$dir = "images\posters"
New-Item -ItemType Directory -Force -Path $dir | Out-Null

$posters = @(
    @{ name = "concrete-utopia.jpg";         url = "https://image.tmdb.org/t/p/original/4l68KHxnPSow8MvnGUpjqLzJtLJ.jpg" },
    @{ name = "the-village.jpg";             url = "https://image.tmdb.org/t/p/original/v7UvYtKfIVaHLaHwVgfalyrK7Ho.jpg" },
    @{ name = "arrival.jpg";                 url = "https://image.tmdb.org/t/p/original/pEzNVQfdzYDzVK0XqxERIw2x2se.jpg" },
    @{ name = "children-of-men.jpg";         url = "https://image.tmdb.org/t/p/original/lQcXgb0fFzffnLV5WY0Q0X2WW7E.jpg" },
    @{ name = "eye-in-the-sky.jpg";          url = "https://image.tmdb.org/t/p/original/faRGb9SuyGuZpsNRoIxoVSLLCId.jpg" },
    @{ name = "the-prestige.jpg";            url = "https://image.tmdb.org/t/p/original/Ag2B2KHKQPukjH7WutmgnnSNurZ.jpg" },
    @{ name = "exorcism-of-emily-rose.jpg";  url = "https://image.tmdb.org/t/p/original/qMN0HIP34f736kkQcfvTfmL9TP3.jpg" },
    @{ name = "the-farewell.jpg";            url = "https://image.tmdb.org/t/p/original/7ht2IMGynDSVQGvAXhAb83DLET8.jpg" },
    @{ name = "the-matrix.jpg";              url = "https://image.tmdb.org/t/p/original/aOIuZAjPaRIE6CMzbazvcHuHXDc.jpg" },
    @{ name = "black-mirror.jpg";            url = "https://image.tmdb.org/t/p/original/y71DeJiAv0dV8H8hiFnuIuyc0Gx.jpg" },
    @{ name = "after-yang.jpg";              url = "https://image.tmdb.org/t/p/original/qjEuDeKOhA7JqaaqhLSfoS9titb.jpg" },
    @{ name = "minority-report.jpg";         url = "https://image.tmdb.org/t/p/original/ccqpHq5tk5W4ymbSbuoy4uYOxFI.jpg" },
    @{ name = "parental-advisory.jpg";       url = "https://image.tmdb.org/t/p/original/v3pkqNnJwPIkIp9jpnyCjKTeein.jpg" }
)

foreach ($poster in $posters) {
    $dest = Join-Path $dir $poster.name
    Write-Host "Downloading $($poster.name)..."
    Invoke-WebRequest -Uri $poster.url -OutFile $dest -UseBasicParsing
    $size = (Get-Item $dest).Length
    Write-Host "  -> $([math]::Round($size/1KB, 1)) KB"
}

Write-Host "`nAll $($posters.Count) posters downloaded to .\$dir"
