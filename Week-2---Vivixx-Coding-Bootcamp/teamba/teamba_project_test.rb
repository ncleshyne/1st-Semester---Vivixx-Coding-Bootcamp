#Test_driven development
#database_


require 'test/unit'
require 'csv'
require_relative 'record.rb'

    class DataList < Test::Unit::TestCase

      def test_reason1
        tester = Record.new(CSV.read('database.csv', headers:true),CSV.read('memberlist.csv', headers:true),'Regular Member')
        assert_equal('Regular Member',tester.reason)
      end

      def test_reason2
        tester = Record.new(CSV.read('database.csv', headers:true),CSV.read('memberlist.csv', headers:true),'Coding Bootcamp')
        assert_equal('Coding Bootcamp',tester.reason)
      end

      def test_reason3
        tester = Record.new(CSV.read('database.csv', headers:true),CSV.read('memberlist.csv', headers:true),'Drop-In Coworking')
        assert_equal('Drop-In Coworking',tester.reason)
      end


      def test_reason4
        tester = Record.new(CSV.read('database.csv', headers:true),CSV.read('memberlist.csv', headers:true),'Attend Event')
        assert_equal('Attend Event',tester.reason)
      end


      def test_reason5
        tester = Record.new(CSV.read('database.csv', headers:true),CSV.read('memberlist.csv', headers:true),'Guest/Other')
        assert_equal('Guest/Other',tester.reason)
      end


    end
