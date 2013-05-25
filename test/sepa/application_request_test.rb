require_relative '../test_helper'

class TestApplicationRequest < MiniTest::Unit::TestCase
  def setup
    keys_path = File.expand_path('../nordea_test_keys', __FILE__)
    @xml_templates_path = File.expand_path('../../../lib/sepa/xml_templates/application_request',
      __FILE__)

    @params = {
      private_key: "#{keys_path}/nordea.key",
      cert: "#{keys_path}/nordea.crt",
      command: :download_file,
      customer_id: '11111111',
      environment: 'PRODUCTION',
      status: 'NEW',
      target_id: '11111111A1',
      language: 'FI',
      file_type: 'TITO',
      wsdl: 'sepa/wsdl/wsdl_nordea.xml',
      content: Base64.encode64("haisuli"),
      file_reference: "11111111A12006030329501800000014"
    }

    @ar = Sepa::ApplicationRequest.new(@params)
    @ar_file = Sepa::ApplicationRequest.new(@params)
    @params[:command] = :get_user_info
    @ar_get = Sepa::ApplicationRequest.new(@params)
    @params[:command] = :download_file_list
    @ar_list = Sepa::ApplicationRequest.new(@params)
    @params[:command] = :upload_file
    @ar_up = Sepa::ApplicationRequest.new(@params)

    @doc = Nokogiri::XML(Base64.decode64(@ar.get_as_base64))
    @doc_file = Nokogiri::XML(Base64.decode64(@ar_file.get_as_base64))
    @doc_get = Nokogiri::XML(Base64.decode64(@ar_get.get_as_base64))
    @doc_list = Nokogiri::XML(Base64.decode64(@ar_list.get_as_base64))
    @doc_up = Nokogiri::XML(Base64.decode64(@ar_up.get_as_base64))
  end

  def test_xml_templates_are_unmodified
    sha1 = OpenSSL::Digest::SHA1.new

    get_user_info_template = File.read("#{@xml_templates_path}/get_user_info.xml")
    download_file_list_template = File.read("#{@xml_templates_path}/download_file_list.xml")
    download_file_template = File.read("#{@xml_templates_path}/download_file.xml")
    upload_file_template = File.read("#{@xml_templates_path}/upload_file.xml")

    get_user_info_digest = sha1.digest(get_user_info_template)
    sha1.reset
    download_file_list_digest = sha1.digest(download_file_list_template)
    sha1.reset
    download_file_digest = sha1.digest(download_file_template)
    sha1.reset
    upload_file_digest = sha1.digest(upload_file_template)

    assert_equal Base64.encode64(get_user_info_digest).strip, "LW5J5R7SnPFPurAa2pM7weTWL1Y="
    assert_equal Base64.encode64(download_file_list_digest).strip, "dYtf4lOP1TXfXPVjYLvaTozhVrg="
    assert_equal Base64.encode64(download_file_digest).strip, "lY+8u+BhXlQmUyQiOiXcUfCUikc="
    assert_equal Base64.encode64(upload_file_digest).strip, "zRQTrNHkq4OLSX3u3ogxU05RJsI="
  end

  def test_ar_should_initialize_with_proper_params
    Sepa::ApplicationRequest.new(@params)
  end

  def test_should_have_customer_id_set
    assert_equal @doc.at_css("CustomerId").content, @params[:customer_id]
  end

  def test_should_have_timestamp_set
    timestamp = Time.strptime(@doc.at_css("Timestamp").content, '%Y-%m-%dT%H:%M:%S%z')
    assert timestamp <= Time.now && timestamp > (Time.now - 60),
    "Timestamp was not set correctly"
  end

  def test_should_have_command_set_when_get_user_info

    assert_equal @doc_get.at_css("Command").content, "GetUserInfo"
  end

  def test_should_have_command_set_when_download_file_list
    assert_equal @doc_list.at_css("Command").content, "DownloadFileList"
  end

  def test_should_have_command_set_when_download_file
    assert_equal @doc_file.at_css("Command").content, "DownloadFile"
  end

  def test_should_have_command_set_when_upload_file
    assert_equal @doc_up.at_css("Command").content, "UploadFile"
  end

  def test_should_have_environment_set
    assert_equal @doc.at_css("Environment").content, @params[:environment]
  end

  def test_should_have_software_id_set
    assert_equal @doc.at_css("SoftwareId").content,
    "Sepa Transfer Library version " + Sepa::VERSION
  end

  def test_should_have_status_set_when_download_file_list
    assert_equal @doc_list.at_css("Status").content, @params[:status]
  end

  def test_should_have_status_set_when_download_file
    assert_equal @doc_file.at_css("Status").content, @params[:status]
  end

  def test_should_not_have_status_set_when_get_user_info
    assert !@doc_get.at_css("Status")
  end

  def test_should_not_have_status_set_when_upload_file
    assert !@doc_up.at_css("Status")
  end

  def test_should_have_target_id_set_when_download_file_list
    assert_equal @doc_list.at_css("TargetId").content, @params[:target_id]
  end

  def test_should_have_target_id_set_when_download_file
    assert_equal @doc_file.at_css("TargetId").content, @params[:target_id]
  end

  def test_should_not_have_target_id_set_when_get_user_info
    assert !@doc_get.at_css("TargetId")
  end

  def test_should_have_file_type_set_when_download_file_list
    assert_equal @doc_list.at_css("FileType").content, @params[:file_type]
  end

  def test_should_have_file_type_set_when_download_file
    assert_equal @doc_file.at_css("FileType").content, @params[:file_type]
  end

  def test_should_have_file_type_set_when_upload_file
    assert_equal @doc_up.at_css("FileType").content, @params[:file_type]
  end

  def test_should_not_have_file_type_set_when_get_user_info
    assert !@doc_get.at_css("FileType")
  end

  def test_should_have_file_reference_set_when_download_file
    assert_equal @doc_file.at_css("FileReference").content, @params[:file_reference]
  end

  def test_should_not_have_file_ref_when_download_file_list
    assert !@doc_list.at_css("FileReference")
  end

  def test_should_not_have_file_ref_when_get_user_info
    assert !@doc_get.at_css("FileReference")
  end

  def test_should_not_have_file_ref_when_upload_file
    assert !@doc_up.at_css("FileReference")
  end

  def test_should_have_content_when_upload_file
    assert_equal @doc_up.at_css("Content").content, Base64.encode64(@params[:content])
  end

  def test_should_not_have_content_when_download_file_list
    assert !@doc_list.at_css("Content")
  end

  def test_should_not_have_content_when_download_file
    assert !@doc_file.at_css("Content")
  end

  def test_should_not_have_content_when_get_user_info
    assert !@doc_get.at_css("Content")
  end

  def test_should_raise_argument_error_with_invalid_command
    assert_raises(ArgumentError) do
      @params[:command] = :wrong_kind_of_command
      ar = Sepa::ApplicationRequest.new(@params)
      doc = ar.get_as_base64
    end
  end
end