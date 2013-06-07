module Sepa
   class CertRequest
    def initialize(params)
      @private_key = params.fetch(:private_key)
      @cert = params.fetch(:cert)
      @command = params.fetch(:command)
      @customer_id = params.fetch(:customer_id)
      @target_id = params[:target_id]
      @ar = ApplicationRequest.new(params)
      @language = params[:language]
    end

    def to_xml
      sign.to_xml
    end

    private

    def load_body
      # Selecting which soap request template to load
      case @command
      when :get_certificate
        path = File.expand_path('../xml_templates/soap/request_certificate.xml', __FILE__)
      when :get_service_certificates
        path = File.expand_path('../xml_templates/soap/request_certificate.xml', __FILE__)
      else
        puts 'Could not load soap request template because command was unrecognised.'
        return nil
      end

      f = File.open(path)
      soap = Nokogiri::XML(f)
      f.close

      soap
    end

    # Loading the soap header
    def load_header
      f = File.open(File.expand_path('../xml_templates/soap/header.xml', __FILE__))
      header = Nokogiri::XML(f)
      f.close

      header
    end

    def process
      soap = load_body

      #Add the base64 coded application request to the soap envelope
      ar_node = soap.xpath("//cer:ApplicationRequest", 'cer' => 'http://bxd.fi/CertificateService').first
      ar_node.content = @ar.get_as_base64

      # Set the customer id
      sender_id_node = soap.xpath("//cer:SenderId", 'cer' => 'http://bxd.fi/CertificateService').first
      sender_id_node.content = @customer_id
      #sender_id_node.content = 1

      # Set the request id, a random 35 digit hex number
      request_id_node = soap.xpath("//cer:RequestId", 'cer' => 'http://bxd.fi/CertificateService').first
      request_id_node.content = SecureRandom.hex(35)
      #request_id_node.content = 2

      # Add timestamp
      timestamp_node = soap.xpath("//cer:Timestamp", 'cer' => 'http://bxd.fi/CertificateService').first
      timestamp_node.content = Time.now.iso8601
      #timestamp_node.content = "2011-02-08T14:00:08Z"
#
#      # Add language
#      language_node = soap.xpath("//bxd:Language", 'cer' => 'http://model.bxd.fi').first
#      language_node.content = @language
#
#      # Add useragent
#      useragent_node = soap.xpath("//bxd:UserAgent", 'cer' => 'http://model.bxd.fi').first
#      useragent_node.content = "Sepa Transfer Library version " + VERSION
#
#      # Add receiver id
#      receiverid_node = soap.xpath("//bxd:ReceiverId", 'cer' => 'http://model.bxd.fi').first
#      receiverid_node.content = @target_id

      #puts soap.to_xml
      soap.to_xml
    end

    # Sign the soap message body using detached signature
    def sign
      soap = process
      soap = Nokogiri::XML(soap)
      #header = load_header

      # Add header timestamps
      #created_node = header.xpath("//wsu:Created", 'wsu' => 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd').first
      #created_node.content = Time.now.iso8601
      #expires_node = header.xpath("//wsu:Expires", 'wsu' => 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd').first
      #expires_node.content = (Time.now + 3600).iso8601

      # Take digest from header timestamps
      #timestamp_node = header.xpath("//wsu:Timestamp", 'wsu' => 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd').first
      #sha1 = OpenSSL::Digest::SHA1.new
      #digestbin = sha1.digest(timestamp_node.canonicalize(mode=Nokogiri::XML::XML_C14N_EXCLUSIVE_1_0,inclusive_namespaces=nil,with_comments=false))
      #digest = Base64.encode64(digestbin)
      #timestamp_digest_node = header.xpath("//dsig:Reference[@URI='#dsfg8sdg87dsf678g6dsg6ds7fg']/dsig:DigestValue", 'dsig' => 'http://www.w3.org/2000/09/xmldsig#').first
      #timestamp_digest_node.content = digest.gsub(/\s+/, "")

      # Take digest from soap request body, base64 code it and put it to the signature
      #body = Nokogiri::XML(soap)
##      body = soap.xpath("//env:Body", 'env' => 'http://schemas.xmlsoap.org/soap/envelope/').first
##      #body = Nokogiri::XML(body)
##      canonbody = body.canonicalize(mode=Nokogiri::XML::XML_C14N_EXCLUSIVE_1_0,inclusive_namespaces=nil,with_comments=false)
      #soap = soap.canonicalize(mode=Nokogiri::XML::XML_C14N_EXCLUSIVE_1_0,inclusive_namespaces=nil,with_comments=false)
      #soap = Nokogiri::XML(soap)
##      sha1 = OpenSSL::Digest::SHA1.new
##      digestbin = sha1.digest(canonbody)
##      digest = Base64.encode64(digestbin)
      #body_digest_node = header.xpath("//dsig:Reference[@URI='#sdf6sa7d86f87s6df786sd87f6s8fsda']/dsig:DigestValue", 'dsig' => 'http://www.w3.org/2000/09/xmldsig#').first
      #body_digest_node.content = digest.gsub(/\s+/, "")

      # Sign SignedInfo element with private key and add it to the correct field
##      signed_info_node = body.xpath("//dsig:SignedInfo", 'dsig' => 'http://www.w3.org/2000/09/xmldsig#').first
##      canon_signed_info = Nokogiri::XML(signed_info_node).canonicalize(mode=Nokogiri::XML::XML_C14N_EXCLUSIVE_1_0,inclusive_namespaces=nil,with_comments=false)
##      digest_sign = OpenSSL::Digest::SHA1.new
##      signature = @private_key.sign(digest_sign, canon_signed_info)
##      signature_base64 = Base64.encode64(signature).gsub(/\s+/, "")

      # Add the base64 coded signature to the signature element
#      signature_node = header.xpath("//dsig:SignatureValue", 'dsig' => 'http://www.w3.org/2000/09/xmldsig#').first
      #signature_node = body.xpath("//dsig:SignatureValue", 'dsig' => 'http://www.w3.org/2000/09/xmldsig#').first
      #signature_node.content = signature_base64

      # Format the certificate and add the it to the certificate element
      #cert_formatted = @cert.to_s.split('-----BEGIN CERTIFICATE-----')[1].split('-----END CERTIFICATE-----')[0].gsub(/\s+/, "")
      #cert_node = body.xpath("//wsse:BinarySecurityToken", 'wsse' => 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd').first
      #cert_node.content = cert_formatted

      # Merge the header and body
      #header.root.add_child(soap.xpath("//env:Body", 'env' => 'http://schemas.xmlsoap.org/soap/envelope/').first)

      #header
      #puts soap.to_xml
      #puts soap
      soap
    end
  end
end