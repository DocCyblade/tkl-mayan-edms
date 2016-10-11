WEBMIN_FW_TCP_INCOMING = 22 80 443 12320 12321

CREDIT_ANCHORTEXT = Turnkey Mayan EDMS Appliance

COMMON_OVERLAYS += adminer nginx
COMMON_CONF += adminer-pgsql


# Include the PostgreSQL/PHP make file 
include $(FAB_PATH)/common/mk/turnkey/pgsql.mk
include $(FAB_PATH)/common/mk/turnkey.mk


