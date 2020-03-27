class Jtkakt < ApplicationRecord
		
	def trigger_create(number)
		@pzn = Pzn.where("PZN = ?", number).last
		@subrguppe = 1
		@dosierung = test
		data ={
		id: (Jtkakt.all.count + 1),
		subgruppe: @subgruppe,
		dosierung: @dosierung,
		pzn: number,
		hr_ges: 100,
		apu_netto: 100,
		kosten_gkv: 100,
		jtk_gkv: 100,
		jtk_apu_netto: 100,
		eingetragen: current_skc
		}
		Jtkakt.create(data)
	end
end
