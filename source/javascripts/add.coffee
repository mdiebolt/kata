splitNumbers = (str, delimeters) ->
  numbers = []

  if delimeters.lemgth
    for delim in delimeters
      for num in str.split(delim)
        numbers.push parseInt(num)
  else
    numbers = (parseInt(num) for num in str.match(/\d+/g))

  (for n in numbers
    if n >= 1000
      0
    else
      (n || 0)
  )

checkNegatives = (str) ->
  if (negatives = str.match(/-\d+/g))?.length
    throw new Error "negatives not allowed: #{negatives.join(', ')}"

window.add = (str) ->
  return 0 if str is ''

  checkNegatives(str)

  delimeters = []

  if str.substring(0, 2) is '//'
    newlinePosition = str.indexOf('\n')

    for delim in str.substring(2, newlinePosition).split(']')
      delimeters.push delim.replace('[', '') unless delim is ''

    str = str.substring(newlinePosition + 1)

  result = 0

  for number in splitNumbers(str, delimeters)
    result += number

  result
