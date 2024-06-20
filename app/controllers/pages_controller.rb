class PagesController < ApplicationController
  def contract
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "contract"   # Excluding ".pdf" extension.
      end
    end
  end
end
