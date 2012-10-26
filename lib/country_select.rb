# encoding: UTF-8

# CountrySelect
require 'country_select/version'

module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using country_options_for_select to generate the list of option tags.
      def country_select(object, method, priority_words = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_country_select_tag(priority_words, options, html_options, COUNTRIES)
      end

      def nationality_select(object, method, priority_words = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_country_select_tag(priority_words, options, html_options, NATIONALITIES)
      end
      # Returns a string of option tags for pretty much any country in the world. Supply a country name as +selected+ to
      # have it marked as the selected option tag. You can also supply an array of countries as +priority_words+, so
      # that they will be listed above the rest of the (long) list.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
      def country_options_for_select(selected = nil, priority_words = nil, words = COUNTRIES)
        country_options = "".html_safe

        if priority_words
          country_options += options_for_select(priority_words, selected)
          country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n".html_safe
          # prevents selected from being included twice in the HTML which causes
          # some browsers to select the second selected option (not priority)
          # which makes it harder to select an alternative priority country
          selected=nil if priority_words.include?(selected)
        end

        return country_options + options_for_select(words, selected)
      end
      # All the countries included in the country_options output.
      COUNTRIES = ["Afghanistan", "Aland Islands", "Albania", "Algeria", "American Samoa", "Andorra", "Angola",
        "Anguilla", "Antarctica", "Antigua And Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria",
        "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin",
        "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil",
        "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia",
        "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China",
        "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo",
        "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba",
        "Curacao", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt",
        "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)",
        "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia",
        "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea",
        "Guinea-Bissau", "Guyana", "Haiti", "Heard and McDonald Islands", "Holy See (Vatican City State)",
        "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran, Islamic Republic of", "Iraq",
        "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya",
        "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan",
        "Lao People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya",
        "Liechtenstein", "Lithuania", "Luxembourg", "Macao", "Macedonia, The Former Yugoslav Republic Of",
        "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique",
        "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of",
        "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru",
        "Nepal", "Netherlands", "New Caledonia", "New Zealand", "Nicaragua", "Niger",
        "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau",
        "Palestinian Territory, Occupied", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines",
        "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation",
        "Rwanda", "Saint Barthelemy", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia",
        "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino",
        "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore",
        "Sint Maarten","Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa",
        "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "Sudan", "Suriname",
        "Svalbard and Jan Mayen", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic",
        "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Timor-Leste",
        "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan",
        "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom",
        "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela",
        "Viet Nam", "Virgin Islands, British", "Virgin Islands, U.S.", "Wallis and Futuna", "Western Sahara",
        "Yemen", "Zambia", "Zimbabwe"] unless const_defined?("COUNTRIES")

      NATIONALITIES = ["Abkhazian","Afghan","Albanian","Algerian","American Samoan","Andorran","Angolan","Anguillan",
        "Antiguan","Argentinian","Armenian","Aruban","Australian","Austrian","Azerbaijani","Bahamian",
        "Bahraini","Bangladeshi","Barbadian","Belarusian","Belgian","Belizean","Beninese","Bermudan",
        "Bhutanese","Bolivian","Bosnian","Botswanan","Brazilian","British Virgin Islander","Bruneian",
        "Bulgarian","Burkinabè","Burmese","Burundian","Cambodian","Cameroonian","Canadian","Cape Verdeanian",
        "Caymanian","Central African","Chadian","Chilean","Chinese","Christmas Islander","Cocos Islander","Colombian",
        "Comorian","Congolese","Cook Islander","Costa Rican","Ivorian","Croatian","Cuban","Cypriot","Czech","Danish",
        "Djiboutian","Dominicand","Dominicane","Timorese","Ecuadorian","Egyptian","Salvadoran","English","Equatorial Guinean",
        "Eritrean","Estonian","Ethiopian","Falkland Islander","Faroese","Fijian","Finnish","French","French Guianese",
        "French Polynesian","Gabonese","Gambian","Georgian","German","Ghanaian","Gibraltar","British","Greek","Greenlandic",
        "Grenadian","Guadeloupe","Guamanian","Guatemalan","Guinean","Guyanese","Haitian","Honduran","Hong Kong","Hungarian",
        "Icelandic","Indian","Indonesian","Iranian","Iraqi","Irish","Manx","Israeli","Italian","Jamaican","Japanese","Jordanian",
        "Kazakhstani","Kenyan","Kiribati","North Korean","South Korean","Kosovan","Kuwaiti","Kyrgyzstani","Laotian","Latvian",
        "Lebanese","Basotho","Liberian","Libyan","Liechtenstein","Lithuanian","Luxembourgish","Macanese","Macedonian",
        "Malagasy","Malawian","Malaysian","Maldivian","Malian","Maltese","Marshallese","Martinican","Mauritanian",
        "Mauritian","Mahoran","Mexican","Micronesian","Moldovan","Monégasque","Mongolian","Montenegrin","Montserratian",
        "Moroccan","Mozambican","Namibian","Nauruan","Nepali","Dutch","New Caledonian","New Zealander","Nicaraguan","Niuean",
        "Nigerien","Nigerian","Norwegian","Northern Irish","Northern Marianan","Omani","Pakistani","Palestinian","Palauan",
        "Panamanian","Papua New Guinean","Paraguayan","Peruvian","Filipino","Pitcairn Islander","Polish","Portuguese","Puerto Rican",
        "Qatari","Réunionese","Romanian","Russian","Rwandan","St. Helenian","Kittitian","St. Lucian","Saint-Pierrais","St. Vincentian",
        "Samoan","Sammarinese","São Toméan","Saudi","Scottish","Senegalese","Serbian","Seychellois","Sierra Leonean","Singaporean",
        "Slovak","Slovenian","Solomon Islander","Somalian","South African","South Ossetian","South Sudanese","Spanish","Sri Lankan",
        "Sudanese","Surinamese","Swazi","Swedish","Swiss","Syrian","Taiwanese","Tajikistani","Tanzanian","Thai","Togolese","Tongan",
        "Trinidadian","Tunisian","Turkish","Turkmen","Tuvaluan","Ugandan","Ukrainian","Emirati","American","Uruguayan",
        "Uzbekistani","Vanuatuan","Venezuelan","Vietnamese","Virgin Islander","Welsh","Futunan","Sahraw","Yemeni",
        "Zambian","Zimbabwean"].sort unless const_defined?("NATIONALITIES")
    end

    class InstanceTag
      def to_country_select_tag(priority_words, options, html_options, words)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            country_options_for_select(value, priority_words, words),
            options, value
          ), html_options
        )
      end
    end

    class FormBuilder
      def country_select(method, priority_words = nil, options = {}, html_options = {})
        @template.country_select(@object_name, method, priority_words, options.merge(:object => @object), html_options)
      end

      def nationality_select(method, priority_words = nil, options = {}, html_options = {})
        @template.nationality_select(@object_name, method, priority_words, options.merge(:object => @object), html_options)
      end
    end
  end
end
