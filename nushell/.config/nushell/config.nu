let-env PROMPT = {
    let datetime = (date now | date format '%Y-%m-%d %H:%M:%S')
    $"~($env.PWD)> $datetime "
}
