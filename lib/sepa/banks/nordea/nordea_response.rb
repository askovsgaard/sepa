module Sepa

  # Handles Nordea specific response logic. Mainly certificate specific stuff.
  class NordeaResponse < Response
    include Utilities

    # Extracts own signing certificate from the response.
    #
    # @return [String] own signing certificate as string it it is found
    # @return [nil] if the certificate cannot be found
    def own_signing_certificate
      application_response = extract_application_response(NORDEA_PKI)
      at = 'xmlns|Certificate > xmlns|Certificate'
      node = Nokogiri::XML(application_response).at(at, xmlns: NORDEA_XML_DATA)

      return unless node

      cert_value = process_cert_value node.content
      cert = x509_certificate cert_value
      cert.to_s
    end

    # Returns the response code in the response. Overrides {Response#response_code} if {#command} is
    # `:get_certificate`, because the namespace is different with that command.
    #
    # @return [String] response code if it is found
    # @return [nil] if response code cannot be found
    # @see Response#response_code
    def response_code
      return super unless command == :get_certificate

      node = doc.at('xmlns|ResponseCode', xmlns: NORDEA_PKI)
      node.content if node
    end

    # Checks whether the certificate embedded in the response soap has been signed with Nordea's
    # root certificate.
    #
    # @return [true] if certificate is trusted
    # @return [false] if certificate fails to verify
    # @see DanskeResponse#certificate_is_trusted?
    def certificate_is_trusted?
      verify_certificate_against_root_certificate(certificate, NORDEA_ROOT_CERTIFICATE)
    end

  end
end
