function get-sanstipoftheday {
    $url = "https://www.sans.org/tip-of-the-day"
    $divclass = "well"
    $regex = '(?<=(<A href="))(.*?(?=">))'
    $r = iwr $url | Select-Object -ExpandProperty AllElements | Where-Object {$_.Class -eq $divclass}

    $link = [regex]::matches($r.innerHTML, $regex).value

    Write-host -ForegroundColor Green "SAN's Tip of the Day!"
    write-host -ForegroundColor Green "---------------------"
    write-host -NonewLine $r.innerText
    write-host -ForegroundColor Yellow " [$url]"
}

get-sanstipoftheday
