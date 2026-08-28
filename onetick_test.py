import os
from dotenv import load_dotenv
import onetick.py as otp

load_dotenv()

os.environ["OTP_WEBAPI"] = "1"
os.environ["OTP_HTTP_ADDRESS"] = "https://rest.cloud.onetick.com"
os.environ["OTP_ACCESS_TOKEN_URL"] = "https://cloud-auth.parent.onetick.com/realms/OMD/protocol/openid-connect/token"
os.environ["OTP_CLIENT_ID"] = os.getenv("ONETICK_CLIENT_ID")
os.environ["OTP_CLIENT_SECRET"] = os.getenv("ONETICK_CLIENT_SECRET")

dbs = otp.databases()
db = dbs["LSE_SAMPLE"]

actions_1 = db.ref_data(
    ref_data_type="corp_actions",
    start=otp.dt(2026, 1, 1),
    end=otp.dt(2026, 8, 28),
    timezone="Europe/London",
    symbol="SDR",
    symbol_date=otp.dt.now()
)

actions_2 = db.ref_data(
    ref_data_type="corp_actions",
    start=otp.dt(2026, 8, 20),
    end=otp.dt(2026, 8, 29),
    timezone="Europe/London",
    symbol="GLEN",
    symbol_date=otp.dt.now()
)

print(actions_1)

print("\nALL CORPORATE ACTIONS")
print(actions_2)

# print("\nACTION TYPES")
# print(actions_2["ADJUSTMENT_TYPE"].value_counts())

print("\nCORP ACTIONS ON 27 AUG 2026")
print(actions_2[actions_2["Time"].dt.date == otp.dt(2026, 8, 27).date()])