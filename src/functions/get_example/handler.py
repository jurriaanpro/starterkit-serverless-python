import json
import os
from typing import Any
from typing import Dict

from aws_lambda_powertools import Logger

GREETING = os.environ["GREETING"]

logger = Logger()


def handle_event(event: Dict[str, Any], context: Dict[str, Any]) -> Dict[str, Any]:
    return {"statusCode": 200, "body": json.dumps(GREETING)}
