
require 'redmine'
require 'redcase'

Redmine::Plugin.register :redcase do

    name 'Redcase'
    description 'Test case management plugin for Redmine'
    version '1.0-alpha-2.42'
    url 'http://redcase.sourceforge.net'
    author 'Redcase Dev Team'

    permission :redcase_manage_test_cases, :redcase => :index, :require => :member
    permission :redcase_execute_test_cases, :redcase => :index, :require => :member
    permission :redcase_view_test_results, :redcase => :index, :require => :member

    menu :project_menu,
         :redcase,
         {
             :controller => 'redcase',
             :action     => 'index'
         },
         {
             :param   => :project_id,
             :caption => :redcase_i18n_tab,
             :after   => :new_issue
         }

    Redcase::Patch::run do
        # TODO: injection in Redmine entities
    end

end
