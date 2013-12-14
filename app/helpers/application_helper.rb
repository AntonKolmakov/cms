module ApplicationHelper
	def active_page(page)
		if @page == nil
			false
		elsif @page.root == page
		 	'active'
		else
		 	false
		end
	end
end
