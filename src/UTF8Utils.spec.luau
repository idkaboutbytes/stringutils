--!strict
--!native

const ReplicatedStorage = game:GetService("ReplicatedStorage")
const require = require(ReplicatedStorage.Packages.Loader).load()

const UTF8Utils = require('UTF8Utils')

return function()
	describe('UTF8Utils.upper', function()
		it('uppercases ascii text', function()
			expect(UTF8Utils.upper('hello')).to.equal('HELLO')
		end)
	end)

	describe('UTF8Utils.lower', function()
		it('lowercases ascii text', function()
			expect(UTF8Utils.lower('HELLO')).to.equal('hello')
		end)
	end)

	describe('UTF8Utils maps', function()
		it('exposes frozen upper and lower maps', function()
			expect(type(UTF8Utils.UPPER_MAP)).to.equal('table')
			expect(type(UTF8Utils.LOWER_MAP)).to.equal('table')
			expect(table.isfrozen(UTF8Utils.UPPER_MAP)).to.equal(true)
			expect(table.isfrozen(UTF8Utils.LOWER_MAP)).to.equal(true)
		end)
	end)
end
