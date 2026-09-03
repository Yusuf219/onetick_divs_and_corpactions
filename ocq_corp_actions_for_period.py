import os
from dotenv import load_dotenv
import onetick.py as otp
import pandas as pd
from datetime import date, timedelta # Unused for now, may use it later

load_dotenv()

os.environ["OTP_WEBAPI"] = "1"
os.environ["OTP_HTTP_ADDRESS"] = "https://rest.cloud.onetick.com"
os.environ["OTP_ACCESS_TOKEN_URL"] = "https://cloud-auth.parent.onetick.com/realms/OMD/protocol/openid-connect/token"
os.environ["OTP_CLIENT_ID"] = os.getenv("ONETICK_CLIENT_ID")
os.environ["OTP_CLIENT_SECRET"] = os.getenv("ONETICK_CLIENT_SECRET")

data = otp.DataSource(db='OQD_CACT_SAMPLE',tick_type='CACT')
result = otp.run(data,
                 start=otp.dt(2024,2, 1,0,0),
                 end=otp.dt(2024, 2, 2,0,0),
                 timezone='UTC',
                 symbols=['EX_DATE'], # As well as ANN_DATE, EX_DATE or REC_DATE
                 )
print(result)

# df = pd.DataFrame(result)
# df.to_csv('/corp_actions.csv', index=False)