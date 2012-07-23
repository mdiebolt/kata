describe "add", ->
  it "should return 0 if the argument is the empty string", ->
    expect(add('')).toEqual(0)

  it "should return the correct value for one number", ->
    expect(add('3')).toEqual(3)

  it "should return the correct value for two numbers", ->
    expect(add('3,5')).toEqual(8)

  it "should return the correct value for any amount of numbers", ->
    expect(add('1,2,3,6')).toEqual(12)
    expect(add('1,2,3,6,8,10')).toEqual(30)

  it "should allow newlines as delimeter between numbers in addition to commas", ->
    expect(add('1\n2')).toEqual(3)
    expect(add('1\n2,3')).toEqual(6)
    expect(add('1,\n')).toEqual(1)

  it "should support other delimeters", ->
    expect(add('//;\n1;2')).toEqual(3)
    expect(add('//&\n4&6&6')).toEqual(16)

  it "should throw an exception with negative numbers", ->
    fn = ->
      add('-1,-2,3')

    expect(fn).toThrow(new Error("negatives not allowed: -1, -2"))

  it "should ignore numbers greater than 1000", ->
    expect(add('3,1001')).toEqual(3)
    expect(add('4,1000')).toEqual(1004)

  it "should support arbitrary length delimeters", ->
    expect(add('//[***]\n1***2***3')).toEqual(6)

  it "should support multiple delimeters", ->
    expect(add('//[*][%]\n1*2%3')).toEqual(6)

  it "should output the results to the console", ->
    spyOn(console, 'log')

    add('5,9,3')

    expect(console.log).toHaveBeenCalledWith(17)

  it "should provide a method the user can call from the console", ->
    spyOn(console, 'log')

    scalc('7,8,9')

    expect(console.log).toHaveBeenCalledWith('the result is 24')
