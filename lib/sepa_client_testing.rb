# This app can be used to test the functionality of the sepa client

require 'sepa'

# payload = File.open("SOLOLMP.DAT").read
payload = "kissa"

params = {
  private_key: 'sepa/nordea_testing/keys/nordea.key',                     # Path for your own private key
  cert: 'sepa/nordea_testing/keys/nordea.crt',                            # Path to your certificate
  command: :download_file,                            # Command :download_file_list, :upload_file, :download_file or :get_user_info
  customer_id: '11111111',                            # Unique customer ID
  status: 'NEW',                                      # For filtering stuff. Must be either NEW, DOWNLOADED or ALL
  target_id: '11111111A1',                            # Some specification of the folder which to access in the bank. I have no idea how this works however.
  file_type: 'TITO',                                  # File types to upload or download:
  # - LMP300 = Laskujen maksupalvelu (lähtevä)
  # - LUM2 = Valuuttamaksut (lähtevä)
  # - KTL = Saapuvat viitemaksut (saapuva)
  # - TITO = Konekielinen tiliote (saapuva)
  # - NDCORPAYS = Yrityksen maksut XML (lähtevä)
  # - NDCAMT53L = Konekielinen XML-tiliote (saapuva)
  # - NDCAMT54L = Saapuvat XML viitemaksu (saapuva)
  wsdl: 'sepa/wsdl/wsdl_nordea.xml',                       # The WSDL file used by nordea. Is identical between banks except for the address.
  content: payload,                                   # The actual payload to send.
  file_reference: "11111111A12006030329501800000014"  # File reference for :download_file command
}

sepa_client = Sepa::SepaClient.new(params) # You just create the client with the parameters described above.
response = sepa_client.send          # And use the send method to send the soap request and pray that you get a proper response.

# Get response body
body = response.body

# Get application response
command = params[:command]
symbol = (command.to_s + "out").to_sym
ar = body[symbol][:application_response]

# Base64 decode
content = Base64.decode64(ar)

# Read the content
xml = Nokogiri::XML(content)

# Remove namespaces for easier parsing
xml.remove_namespaces!

# Some ugly test outputs
case command
when :download_file_list
  puts "Files"
  xml.search("FileDescriptor").each do |i|
    puts i.at('FileReference').content
  end
when :get_user_info
  puts "User info"
  xml.search("FileTypeService").each do |i|
    puts i.at('ServiceId').content
  end
when :upload_file
  code = xml.at('ResponseCode').content
  text = xml.at('ResponseText').content
  puts "Code: #{code}"
  puts "Text: #{text}"
when :download_file
  data = xml.at('Content').content
  file = Base64.decode64(data)
  puts "File"
  puts file
else
  puts "Unknown command"
end