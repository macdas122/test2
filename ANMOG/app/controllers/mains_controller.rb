class MainsController < ApplicationController
    def index
      @mains = Main.find_by_sql(
	"
	SELECT
		mains.id,
		mains.gba_number,
		mains.drug_name,
		mains.brand_name,
		mains.manufacturer,
		mains.status,
		mains.indication,
		mains.field_of_application,
		mains.orphan_drug,
		COUNT(subgroups.id) as subgroup_count,
		COUNT(gbasubgroups.id) as gbssubgroup_count
	FROM mains
	LEFT OUTER JOIN subgroups
		ON mains.gba_number = subgroups.verfahrensnummer
	LEFT OUTER JOIN gbasubgroups
		ON mains.gba_number = gbasubgroups.verfahrensnummer
	GROUP BY
		mains.id
	ORDER BY
		mains.gba_number	
	"
	)
	$test = Main.all.limit(2)		
    end
    def export     
	send_data $test.to_csv, filename:"verfahren-#{Date.today}.csv" ,disposition: 'download'
    end
    def show
        if params[:keywords].present?
            @keywords = params[:keywords]
            main_search_term = MainSearchTerm.new(@keywords)
            @mains = Main.where(
                main_search_term.where_clause,
                main_search_term.where_args).
                order(main_search_term.order).order(:gba_number)
	    $test = @mains

            @result = Main.where(
                main_search_term.where_clause,
                main_search_term.where_args).
                group(:field_of_application)

            @orphan = Main.where(
                main_search_term.where_clause,
                main_search_term.where_args).
                group(:orphan_drug)

            @indikation = Main.where(
                main_search_term.where_clause,
                main_search_term.where_args).
                group(:indication)



        else
            @mains = Main.all.order(:gba_number)
            @result = Main.all.group(:field_of_application)
            @orphan = Main.all.group(:orphan_drug)
	    @indikation = Main.all.group(:indication)
	    $test = @mains
        end
    end		
    def edit
	@mains = Main.find(params[:id]) 
        @title = "AMNOG:  #{@mains.gba_number}#-#{@mains.drug_name}"   
    	@wirkstoff = Main.where("drug_name = '%s' ", @mains.drug_name).order(:start_procedure)

        @pc = Subgroup.where('verfahrensnummer  = ?', @mains.gba_number) 
        @gba = Gbasubgroup.where('verfahrensnummer  = ?', @mains.gba_number) 
        @iq = Iqsubgroup.where('verfahrensnummer  = ?', @mains.gba_number) 

	@studies = Array[]
	@id = Array[]
	@pc.each do |pc|
	    if pc.studie_eins.present? then @studies.push(pc.studie_eins) end
	    if pc.studie_zwei.present? then @studies.push(pc.studie_zwei) end
            if pc.studie_drei.present? then @studies.push(pc.studie_drei) end
            if pc.studie_vier.present? then @studies.push(pc.studie_vier) end
            if pc.studie_fuenf.present? then @studies.push(pc.studie_fuenf) end
            if pc.studie_sechs.present? then @studies.push(pc.studie_sechs) end
	end
        @gba.each do |pc|
            if pc.studie_eins.present? then @studies.push(pc.studie_eins) end
            if pc.studie_zwei.present? then @studies.push(pc.studie_zwei) end
            if pc.studie_drei.present? then @studies.push(pc.studie_drei) end
            if pc.studie_vier.present? then @studies.push(pc.studie_vier) end
            if pc.studie_fuenf.present? then @studies.push(pc.studie_fuenf) end
            if pc.studie_sechs.present? then @studies.push(pc.studie_sechs) end
        end

        @iq.each do |pc|
            if pc.studie_eins.present? then @studies.push(pc.studie_eins) end
            if pc.studie_zwei.present? then @studies.push(pc.studie_zwei) end
            if pc.studie_drei.present? then @studies.push(pc.studie_drei) end
            if pc.studie_vier.present? then @studies.push(pc.studie_vier) end
            if pc.studie_fuenf.present? then @studies.push(pc.studie_fuenf) end
            if pc.studie_sechs.present? then @studies.push(pc.studie_sechs) end
        end
	@studies = @studies.uniq


	@pzn = Pzn.where('"Wirkstoffe" = ?', @mains.drug_name).uniq {|h| h[:pzn]}	

	@price = []
	@test = []		
	@pzn.each do |ps|
	  temp = Jtkakt.where('"pzn" = ?' , ps.pzn.to_s)
	   temp.each do |te|
	     if te != nil
	       @test << te	
	     end
	   end
	  end	
        if @test.any?
     	zw = @test[0].zuweisung
	preis = 0
        @test.sort_by(&:zuweisung).each do |t|
		if zw == t.zuweisung
		    preis = preis + t.jtk_apu_netto
		else
		  zw = t.zuweisung
		  if preis != 0
		  @price << preis
		  end
                  preis = t.jtk_apu_netto
		end	
	end
	@price << preis
	end

	@pricegb = []
	@testgb = []
	@pzn.each do |ps|
        temp = Jtkgba.where('"pzn" = ?' , ps.pzn.to_s).where('"eingetragen" = ?' , @mains.gba_number.to_s)	 
	temp.each do |t|
	   if t != nil   
             @testgb << t
	   end
         end
        end
	if @testgb.any?
        zw = @testgb[0].zuweisung
        preis = 0
        @testgb.sort_by(&:zuweisung).each do |t|
                if zw == t.zuweisung
                    preis = preis + t.jtk_apu_netto
                else
                  zw = t.zuweisung
                  if preis != 0
		  @pricegb << preis
		  end
                  preis = t.jtk_apu_netto
                end
        end
        @pricegb << preis
	end

        @pricepv = []
	@testpv = []
        @pzn.each do |pv|
        temp = Jtkpvh.where('"pzn" = ?' , pv.pzn.to_s).where('"eingetragen" = ?' , @mains.gba_number.to_s)
         temp.each do |tv|
           if tv != nil
             @testpv << tv
           end
         end
        end
	if @testpv.any?
          zw = @testpv[0].zuweisung
	  preis = 0
          @testpv.sort_by(&:zuweisung).each do |t|
                if zw == t.zuweisung
                    preis = preis + t.jtk_apu_netto
                else
                  zw = t.zuweisung
		  if preis != 0
                  @pricepv << preis
		  end
                  preis = t.jtk_apu_netto
                end
          end
        @pricepv << preis
	end

        if (@price.any? == false)
                @price << 0
        end
        if (@pricegb.any? == false)
                @pricegb << 0
        end
        if (@pricepv.any? == false)
                @pricepv << 0
        end



	end
    end
