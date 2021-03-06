#!/usr/bin/env ruby
# frozen_string_literal: true
#
# 07.10.2017 - Bodo Schulz
#
#
# Examples for Servicegroups

# -----------------------------------------------------------------------------

require_relative '../lib/icinga2'
require_relative 'config'

# -----------------------------------------------------------------------------

i = Icinga2::Client.new( @config )

unless( i.nil? )

  # run tests ...
  #
  #

  begin

    puts ' ------------------------------------------------------------- '
    puts ''

    puts ' ==> SERVICEGROUPS'
    puts ''

    %w[disk foo].each do |h|

      e = i.exists_servicegroup?( h ) ? 'true' : 'false'
      puts format( '= check if Servicegroup \'%s\' exists : %s', h, e )
    end
    puts ''

    %w[disk foo].each do |h|
      puts format( '= list named Servicegroup \'%s\':', h )
      puts i.servicegroups( service_group: h )
    end
    puts ''

    puts '= list all Servicegroup'
    puts i.servicegroups
    puts ''

    puts '= add Servicegroup \'foo\''
    puts i.add_servicegroup( service_group: 'foo', display_name: 'FOO' )
    puts ''

    puts '= add Servicegroup \'foo\' (again)'
    puts i.add_servicegroup( service_group: 'foo', display_name: 'FOO' )
    puts ''

    puts '= list named Servicegroup \'foo\''
    puts i.servicegroups( service_group: 'foo' )
    puts ''

    puts '= delete Servicegroup \'foo\''
    puts i.delete_servicegroup( service_group: 'foo' )
    puts ''

    puts '= delete Servicegroup \'foo\' (again)'
    puts i.delete_servicegroup( service_group: 'foo' )
    puts ''

    puts ' ------------------------------------------------------------- '
    puts ''

  rescue => e
    warn( e )
    warn( e.backtrace.join("\n") )
  end
end


# -----------------------------------------------------------------------------

# EOF
