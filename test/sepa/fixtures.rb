def nordea_generic_params
  cert = "-----BEGIN CERTIFICATE-----
MIIDwTCCAqmgAwIBAgIEAX1JuTANBgkqhkiG9w0BAQUFADBkMQswCQYDVQQGEwJT
RTEeMBwGA1UEChMVTm9yZGVhIEJhbmsgQUIgKHB1YmwpMR8wHQYDVQQDExZOb3Jk
ZWEgQ29ycG9yYXRlIENBIDAxMRQwEgYDVQQFEws1MTY0MDYtMDEyMDAeFw0xMzA1
MDIxMjI2MzRaFw0xNTA1MDIxMjI2MzRaMEQxCzAJBgNVBAYTAkZJMSAwHgYDVQQD
DBdOb3JkZWEgRGVtbyBDZXJ0aWZpY2F0ZTETMBEGA1UEBRMKNTc4MDg2MDIzODCB
nzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAwtFEfAtbJuGzQwwRumZkvYh2BjGY
VsAMUeiKtOne3bZSeisfCq+TXqL1gI9LofyeAQ9I/sDm6tL80yrD5iaSUqVm6A73
9MsmpW/iyZcVf7ms8xAN51ESUgN6akwZCU9pH62ngJDj2gUsktY0fpsoVsARdrvO
Fk0fTSUXKWd6LbcCAwEAAaOCAR0wggEZMAkGA1UdEwQCMAAwEQYDVR0OBAoECEBw
2cj7+XMAMBMGA1UdIAQMMAowCAYGKoVwRwEDMBMGA1UdIwQMMAqACEALddbbzwun
MDcGCCsGAQUFBwEBBCswKTAnBggrBgEFBQcwAYYbaHR0cDovL29jc3Aubm9yZGVh
LnNlL0NDQTAxMA4GA1UdDwEB/wQEAwIFoDCBhQYDVR0fBH4wfDB6oHigdoZ0bGRh
cCUzQS8vbGRhcC5uYi5zZS9jbiUzRE5vcmRlYStDb3Jwb3JhdGUrQ0ErMDElMkNv
JTNETm9yZGVhK0JhbmsrQUIrJTI4cHVibCUyOSUyQ2MlM0RTRSUzRmNlcnRpZmlj
YXRlcmV2b2NhdGlvbmxpc3QwDQYJKoZIhvcNAQEFBQADggEBACLUPB1Gmq6286/s
ROADo7N+w3eViGJ2fuOTLMy4R0UHOznKZNsuk4zAbS2KycbZsE5py4L8o+IYoaS8
8YHtEeckr2oqHnPpz/0Eg7wItj8Ad+AFWJqzbn6Hu/LQhlnl5JEzXzl3eZj9oiiJ
1q/2CGXvFomY7S4tgpWRmYULtCK6jode0NhgNnAgOI9uy76pSS16aDoiQWUJqQgV
ydowAnqS9h9aQ6gedwbOdtkWmwKMDVXU6aRz9Gvk+JeYJhtpuP3OPNGbbC5L7NVd
no+B6AtwxmG3ozd+mPcMeVuz6kKLAmQyIiBSrRNa5OrTkq/CUzxO9WUgTnm/Sri7
zReR6mU=
-----END CERTIFICATE-----"
  pkey = "-----BEGIN PRIVATE KEY-----
MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMLRRHwLWybhs0MM
EbpmZL2IdgYxmFbADFHoirTp3t22UnorHwqvk16i9YCPS6H8ngEPSP7A5urS/NMq
w+YmklKlZugO9/TLJqVv4smXFX+5rPMQDedRElIDempMGQlPaR+tp4CQ49oFLJLW
NH6bKFbAEXa7zhZNH00lFylnei23AgMBAAECgYEAqt912/7x4jaQTrxlSELLFVp9
eo1BesVTiPwXvPpsGbbyvGjZ/ztkXNs9zZbh1aCGzZMkiR2U7F5GlsiprlIif4cF
6Xz7rCjaAs7iDRt9PjhjVuqNGR2I+VIIlbQ9XWFJ3lJFW3v7TIZ8JbLnn0XOFz+Z
BBSSGTK1zTNh4TBQtjECQQDe5M3uu9m4RwSw9R6GaDw/IFQZgr0oWSv0WIjRwvwW
nFnSX2lbkNAjulP0daGsmn7vxIpqZxPxwcrU4wFqTF5dAkEA38DnbCm3YfogzwLH
Nre2hBmGqjWarhtxqtRarrkgnmOd8W0Z1Hb1dSHrliUSVSrINbK5ZdEV15Rpu7VD
OePzIwJAPMslS+8alANyyR0iJUC65fDYX1jkZOPldDDNqIDJJxWf/hwd7WaTDpuc
mHmZDi3ZX2Y45oqUywSzYNtFoIuR1QJAZYUZuyqmSK77SdGB36K1DfSi9AFEQDC1
fwPAbTwTv6mFFPAiYxLiRZXxVPtW+QtjMXH4ymh2V4y/+GnCqbZyLwJBAJQSDAME
Sn4Uz7Zjk3UrBIbMYEv0u2mcCypwsb0nGE5/gzDPjGE9cxWW+rXARIs+sNQVClnh
45nhdfYxOjgYff0=
-----END PRIVATE KEY-----"

  {
    bank: :nordea,
    private_key: OpenSSL::PKey::RSA.new(pkey),
    cert: cert,
    command: :download_file,
    customer_id: '11111111',
    environment: 'PRODUCTION',
    status: 'NEW',
    target_id: '11111111A1',
    language: 'FI',
    file_type: 'TITO',
    content: Base64.encode64("haisuli"),
    file_reference: "11111111A12006030329501800000014"
  }
end

def nordea_cert_params
  csr = "-----BEGIN CERTIFICATE REQUEST-----
MIIBczCB3QIBADA0MRIwEAYDVQQDEwlEZXZsYWIgT3kxETAPBgNVBAUTCDExMTEx
MTExMQswCQYDVQQGEwJGSTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAo9wU
c2Ys5hSso4nEanbc+RIhL71aS6GBGiWAegXjhlyb6dpwigrZBFPw4u6UZV/Vq7Y7
Ku3uBq5rfZwk+lA+c/B634Eu0zWdI+EYfQxKVRrBrmhiGplKEtglHXbNmmMOn07e
LPUaB0Ipx/6h/UczJGBINdtcuIbYVu0r7ZfyWbUCAwEAAaAAMA0GCSqGSIb3DQEB
BQUAA4GBAIhh2o8mN4Byn+w1jdbhq6lxEXYqdqdh1F6GCajt2lQMUBgYP23I5cS/
Z+SYNhu8vbj52cGQPAwEDN6mm5yLpcXu40wYzgWyfStLXV9d/b4hMy9qLMW00Dzb
jo2ekdSDdw8qxKyxj1piv8oYzMd4fCjCpL+WDZtq7mdLErVZ92gH
-----END CERTIFICATE REQUEST-----"

  {
    bank: :nordea,
    command: :get_certificate,
    customer_id: '11111111',
    environment: 'TEST',
    csr: csr,
    pin: '1234567890',
    service: 'service'
  }
end

def danske_cert_params
  encryptpkcs = "-----BEGIN CERTIFICATE REQUEST-----
MIICZjCCAU4CAQAwITESMBAGA1UEAxMJRGV2bGFiIE95MQswCQYDVQQGEwJGSTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKN2ceFGw+i4wAyg6WApu7/h
5Rpl8tp+QRX1eLbmftYpf6bbzj+JwspWNST/s8p8enGBRrK+HkNT8ayj7ZSubJwx
g/bAn+ewxk64A984hiMqd0GMJgwFcWhGpHhwH9QiqA5CAQYXY0T1fs2UXf1mIJ1Z
675yGRhU03ZyQgyIjhdTmXLznCluSLeIGypXPi7DCfHP5w0a6Dfpy31fowqi7n9A
gyoQ6JZuuXHAdEoQpNmxgpp9gBwxs9U+yBmDaBAvvB0DY3+0kMRFCn2oyCuQw5C4
mRo+0eOO+kA8Svd2bLXmcbe6js/5SgjvkHvvCgIqi9J6aPiJo0XCrLsB6BjQbpsC
AwEAAaAAMA0GCSqGSIb3DQEBBQUAA4IBAQAXepnKWQWTCiTKXhuT+e52n0/x5YHd
bLB8nelPpyMf0hiNeoUdzNTZoMM2OArtzvOhh5HWZ32GbjR/RDCy+kMfAGDm/tlB
/4uJNcDotMFF+MUsEAHVrAUpZh5n00mBeYDl7m098VnAEayxUxJHbQMYY1J1QdTl
M62i5c2v3sNJlDlT4GidRtoGW9KAID2oCdOL94krWpwLAZDP4wLwG7ACCbOx3rST
f9gDE6jFUn7ONuiiYvOBAqjwckDpyOH+vx3WkZH4cwdcp4KVeLnjJzlJZaw7yTIo
z8BKfQ26LmOO/S4CFe3Vzq6FRNKl3D4nvCu06WoMi5tAAEi57tk05B32
-----END CERTIFICATE REQUEST-----"
  signingpkcs = "-----BEGIN CERTIFICATE REQUEST-----
MIICZjCCAU4CAQAwITESMBAGA1UEAxMJRGV2bGFiIE95MQswCQYDVQQGEwJGSTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAK3yym5CztvmJCxbzhy6tOph
wzamimFKlJt88cG0VLzwAh0EiAhFz9Yj/39n1HywL+4xOLizIAup794MzLBDs3TH
OAZe7iZSrb5y4PMh5l9jwhXLPu7/tkqswcvMtstI5HZGqEqdw0kAT0BuKJBXdo+e
8nOCVsiMPhrtk5ovLY54vWMzwfAQJeBkxbr1LH6Ib4k7IlsysKpQt7+VqQcTc/lL
IC+MnVfmKDA0qTXFKQsZC2hO353cu9ZfjdrnKpo5gutcPJRu+TBNS8HJNkI+3pNM
MTGPvweeY461tzgOpeSzL+FkmRFSWksOmPol1Q4DDZryYHaLDv7q6lELNDxEwQ8C
AwEAAaAAMA0GCSqGSIb3DQEBBQUAA4IBAQAIw3tbNWTsayBm4bUzugNKCFreayTo
5npG3JUiA+n5jIdj3egqSXwxkXSJ5tdXcv0xqsFkV0wq3l5wEaeG7Jd7vLD6FX2y
MbtE49PHHcLwcY0U94qBj6qEleRwebGfyKwpMb2M90cAf3V/5IjZUJfvYyjOBQUT
H6Xhm3JG9g7AScHhFcM8r6PhmzcL1FubYBPTcUBuotDBYc4lbql7sbww/u8OyWvl
aIFd+oiwXGSYB7L8Fqg469jeIf0QtOZUtUEGOJWjM4JjTy+NnVmsj0jszMbuBZBW
7wOrp+GMBUZ9/vaY/zr7nvJTfvKz7CJQOgADeh/0imZqhIYfVKIpJxR5
-----END CERTIFICATE REQUEST-----"
  danskebankencrypt = "-----BEGIN CERTIFICATE-----
MIIEATCCAumgAwIBAgIFAQjv8bMwDQYJKoZIhvcNAQELBQAwgZgxEDAOBgNVBAMT
B0RCR1JPT1QxCzAJBgNVBAYTAkRLMRMwEQYDVQQHEwpDb3BlbmhhZ2VuMRAwDgYD
VQQIEwdEZW5tYXJrMRowGAYDVQQKExFEYW5za2UgQmFuayBHcm91cDEaMBgGA1UE
CxMRRGFuc2tlIEJhbmsgR3JvdXAxGDAWBgNVBAUTDzYxMTI2MjI4MTExMDAwMjAe
Fw0xMjA4MDEwMDAwMDBaFw0xNDEwMzEwMDAwMDBaMIGYMRAwDgYDVQQDEwdEUENS
WVBUMQswCQYDVQQGEwJESzETMBEGA1UEBxMKQ29wZW5oYWdlbjEQMA4GA1UECBMH
RGVubWFyazEaMBgGA1UEChMRRGFuc2tlIEJhbmsgR3JvdXAxGjAYBgNVBAsTEURh
bnNrZSBCYW5rIEdyb3VwMRgwFgYDVQQFEw82MTEyNjIyODQ5MTAwMDMwggEgMA0G
CSqGSIb3DQEBAQUAA4IBDQAwggEIAoIBAQC/kHrOvHOueBsit9drxIHpaD7mXINy
pXS/l9PbbOZ0lZKVEfW9gtG8xk9XggsPXHJMF/PXpG6mveXvPu9WW/XpryAUqGfv
YsC7Px3ixaJb2EMOL+2mJYd0v5HKg5RuYkQ82k3K01hMNEGYs0OotjNVAimQcTLt
VPDGBjK5BUAiwady9LpI6afo7roJWnRmsvSvinDgBqswnfCvUfSfM8cZyhnLLC2u
j1kBHAD/5xpllmS3aq1M8LqFkBYcCE5PdPmFWhGUumZ/Y5qLjDgcPMAPvUaKLqOs
h22jvPCZ0pm17eV0bSQzWe5e0zkgCYAepuFRazSlkJQYBdS47Mp68dY5AgEDo1Iw
UDAfBgNVHSMEGDAWgBSE+uW/3pFJZt/FilLDs7ezIBzHbTAdBgNVHQ4EFgQUP6wH
VNOmznu212c08M3oeYjeXW4wDgYDVR0PAQH/BAQDAgQwMA0GCSqGSIb3DQEBCwUA
A4IBAQAvJBfPug+ixGL/zWUnKMweV80atZXMjHJEn4mOE+iUkCNONLImMMt6MXJy
snJViL1gL5xMrka6A62PLLsVkl79kxDDbzXMPfGt5/mB9L7CMpyzaID0acDii3rs
ZwT3Wxpnate6wowN4zpmXgpCpTDGbxjuVRiOArsjQblerhfxnD/UAieZ1IWozIAN
s6SVms/TuOB+bODUr06ITxBkDJhizOJxjsXRIAtwZvvrH4qGjJz5qFcPb3nz4Txw
swU8X6yvbtqF+q4aAKPA6ZydnGZFQSoSzNJtcF28T1ItxEHN3+xyQqXpTgFviiuL
277LaAl9YUFFnSgeh7GiFitWJPfD
-----END CERTIFICATE-----"
    danskesigning = "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAvTnADLhlBL5Rdh7ckCeVueT+a77DwLymGO/PQJAUnOiCOA3h
dEPzg2ruKk9VgC5+ADTXDD4HIxYO0LB0l1hNTr0GhIbjGI4HLgBSlE1lS/v9rWy8
kQvFVBBysh3oo3aW27AqSGIUSZzHdOaf0vVmCM69aoHZ3rNHR4RoXA0nqisxBYKb
SepKSJ+BdIEthbgzOz5ybHY6CCIEU+TIbCEkhACXFk52hmId2ODmjnK9pF6EOyJ3
CMD8jOksjrb4E9ylChsX135jVqBWoyv49mkzCW7abhkgEB8Ap2nBp27Cm+nFGElW
co5gKwdEKjrkA2B/Hz6KoceR6OydaaZnUI7T5QIDAQABAoIBADNUoSZSNwUMY6i5
QnfQZStiVSoBO7Ti9+O32e7Xpt/RqtFt4oTZkgtKTIUptDXrZr7Dlrp5cRIxf59Y
3qfXilEbsdLtjFky3fu6lqwoOpxcJTqQTq7CFKtzMsnilyMQnmfF6BJumLZHU0wA
68YcT6t/+Z4Uz3c8Bs/9uRmPb/0W9qkWhH35JKtlFyN2g6nyKMCpYoll+FNun3nr
e6gqZ9lNbqWOAnf2hfZWIKXLHxh9Eko/kQQYzo1Y0bwJ9v5nbqpxpXn77Ys9eL63
Z7gQDVoYhaOVBzWWvp7bDQ0RlJ5dliWwfqSy7l5/u7/yuzcuozsE4/zsuGQEcgve
b721MhkCgYEA69tYh6QdlQtRq9SRmEe16X2UoWLN+tLNvAqdQxDqbwE0R8JxlW4z
gMpmM58L49aNQA50485jLZJaGwmK6vRpb9IBKB6iB94q20DtB4t1VNNQU3RtzbMQ
cdvJ+ocftflqaRMgAtKDbdeDtYxaG27g6Jz+yw8fq6krWaSIwoChHFcCgYEAzWLh
9+9yEPVlEW8CodIvhbCdeRnklgw/TZs6tg/B+99mN0QDeG/c2jbxBcOZ0DgksAn5
/bvhh1oRSOsZLDE9+ILjtTThbs6c4U2QyQxgvTRzX/NEHwid8rxk04mBOQtpYMD0
Y1yDg+qnJl3Zev6+DGQB9WbthJuOX/XWfEn/LCMCgYAxYhnlPK2c+WO+UKGzesBS
BSNLrz5lmCHPj4Fh+3a6i0wBAmt52DscakR/5ns81z13/g7na91EO3J2Wsclbsts
yFHJrrBKaXAbvDpk7ARDIIOfFa+v9CArVtOxiv1OwsxO99wp+x3dr9Q5/QsY11xs
GAMZTS9aZ+9Vs6eW4gvZvQKBgQCOEalHTJ01d9mKfqRudSqkKnAzNaL129DqCMdK
6ol/hZ95+RUBeTdmxnxgRVYfPsa58py3VAAEFVxBeUY3WHSKc1e5n7OUZ10DSBkv
yN0d46svIuHrKZXAM2r3HHWDlQ42fCJQnMzoMiefFWn7dzzU61SjgKgpg0Svwii0
XqcgywKBgAuj8hccUY5e5yRUGAqXrBfFCJN53ftkBaVtV0nqxJ2jXwIEqYCVohuM
gnUi1U8K+UAVu7JQJG1VUBEDcKFN2p/47KdpBx3calcurRmNL8Ual2ANPMC55RUD
11qQJynyu37oWB74v3VByP38tYy6tWmHUg55fMbjUtKW2AHdIXV5
-----END RSA PRIVATE KEY-----"

  {
    bank: :danske,
    command: :create_certificate,
    customer_id: 'ABC123',
    environment: 'customertest',
    key_generator_type: 'software',
    encryption_cert_pkcs10: encryptpkcs,
    signing_cert_pkcs10: signingpkcs,
    enc_cert: danskebankencrypt,
    pin: '1234',
    language: 'EN',
    file_type: 'TITO',
    file_reference: '12314',
    target_id: 'Danske FI',
    status: 'NEW',
  }
end
