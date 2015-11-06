import os
import sys
sys.path.insert(0, os.path.join(os.path.dirname(os.path.realpath(__file__)), '../'))
os.environ["DJANGO_SETTINGS_MODULE"] = "settings"
os.environ["STACKTACH_DB_NAME"] = "stacktach"
os.environ["STACKTACH_DB_HOST"] = "lb-db"
os.environ["STACKTACH_DB_USERNAME"] = "stacktach"
os.environ["STACKTACH_DB_PASSWORD"] = "stacktach_pass"
os.environ["STACKTACH_DB_PORT"] = "3306"
os.environ["STACKTACH_INSTALL_DIR"] = "/opt/stacktach/"
os.environ["STACKTACH_DEPLOYMENTS_FILE"] = "/opt/stacktach/etc/stacktach_worker_config.json"
os.environ["STACKTACH_VERIFIER_CONFIG"] = "/opt/stacktach/etc/stacktach_verifier_config.json"
sys.path.append("/opt/stacktach")
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
