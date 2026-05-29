--!strict
--!native

const ReplicatedStorage = game:GetService("ReplicatedStorage")
const require = require(ReplicatedStorage.Packages.Loader).load()

const String = require('String')

return function()
	describe('String.trim', function()
		it('trims whitespace by default', function()
			expect(String.trim('  hello  ', nil)).to.equal('hello')
		end)

		it('trims a custom pattern', function()
			expect(String.trim('---hello---', '%-')).to.equal('hello')
		end)
	end)

	describe('String casing', function()
		it('converts to camel case', function()
			expect(String.toCamelCase('hello_world')).to.equal('HelloWorld')
		end)

		it('converts to lower camel case', function()
			expect(String.toLowerCamelCase('HELLO_WORLD')).to.equal('helloWorld')
		end)

		it('uppercases first letter', function()
			expect(String.uppercaseFirstLetter('hello')).to.equal('Hello')
		end)

		it('converts to private case', function()
			expect(String.toPrivateCase('HelloWorld')).to.equal('_helloWorld')
		end)
	end)

	describe('String predicates', function()
		it('detects whitespace strings', function()
			expect(String.isWhitespace('   ')).to.equal(true)
			expect(String.isWhitespace(' a ')).to.equal(false)
		end)

		it('detects empty or whitespace or nil', function()
			expect(String.isEmptyOrWhitespaceOrNil('')).to.equal(true)
			expect(String.isEmptyOrWhitespaceOrNil('   ')).to.equal(true)
			expect(String.isEmptyOrWhitespaceOrNil(nil :: any)).to.equal(true)
			expect(String.isEmptyOrWhitespaceOrNil('hello')).to.equal(false)
		end)
	end)

	describe('String prefix and postfix helpers', function()
		it('removes prefix when present', function()
			expect(String.removePrefix('prefixValue', 'prefix')).to.equal('Value')
		end)

		it('removes postfix when present', function()
			expect(String.removePostfix('ValueSuffix', 'Suffix')).to.equal('Value')
		end)

		it('checks starts and ends with', function()
			expect(String.startsWith('abcdef', 'abc')).to.equal(true)
			expect(String.endsWith('abcdef', 'def')).to.equal(true)
		end)
	end)

	describe('String formatting helpers', function()
		it('limits string length with ellipsis', function()
			expect(String.elipseLimit('abcdef', 5)).to.equal('ab...')
		end)

		it('adds commas to numbers', function()
			expect(String.addCommas(1234567, ',')).to.equal('1,234,567')
		end)

		it('splits strings by separator', function()
			local result = String.split('a,b,c', ',')
			expect(#result).to.equal(3)
			expect(result[2]).to.equal('b')
		end)
	end)
end
