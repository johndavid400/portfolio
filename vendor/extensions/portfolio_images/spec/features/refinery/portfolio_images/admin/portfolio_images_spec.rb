# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PortfolioImages" do
    describe "Admin" do
      describe "portfolio_images" do
        refinery_login_with :refinery_user

        describe "portfolio_images list" do
          before do
            FactoryGirl.create(:portfolio_image, :title => "UniqueTitleOne")
            FactoryGirl.create(:portfolio_image, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.portfolio_images_admin_portfolio_images_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.portfolio_images_admin_portfolio_images_path

            click_link "Add New Portfolio Image"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::PortfolioImages::PortfolioImage.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::PortfolioImages::PortfolioImage.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:portfolio_image, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.portfolio_images_admin_portfolio_images_path

              click_link "Add New Portfolio Image"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::PortfolioImages::PortfolioImage.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:portfolio_image, :title => "A title") }

          it "should succeed" do
            visit refinery.portfolio_images_admin_portfolio_images_path

            within ".actions" do
              click_link "Edit this portfolio image"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:portfolio_image, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.portfolio_images_admin_portfolio_images_path

            click_link "Remove this portfolio image forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::PortfolioImages::PortfolioImage.count.should == 0
          end
        end

      end
    end
  end
end
