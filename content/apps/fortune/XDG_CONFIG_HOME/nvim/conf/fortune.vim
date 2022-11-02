let g:startify_custom_header = map(split(system("fortune.sh"), '\n'), 'repeat(" ", 8) . v:val')

