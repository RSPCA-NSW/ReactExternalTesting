"""CumulusCI tasks that run mock data shell scripts via the org's Salesforce CLI alias."""

from cumulusci.core.exceptions import CommandException
from cumulusci.tasks.command import Command


class MockDataCommand(Command):
    """Execute a mock import/clear script with SF_TARGET_ORG set to org_config.sfdx_alias.

    Uses the same sf CLI auth as ``sf --target-org <alias>``, not OAuth env vars.
    """

    salesforce_task = True

    task_docs = """
        Runs mock import/clear scripts with ``SF_TARGET_ORG`` set to the CCI org's
        ``sfdx_alias`` (e.g. ``AnimalOS__dev`` for ``--org dev``).
    """

    def _get_env(self):
        env = super()._get_env()
        alias = getattr(self.org_config, "sfdx_alias", None) or ""
        if not alias:
            raise CommandException(
                "No sfdx_alias on org config. Link the org to Salesforce CLI first "
                "(e.g. cci org scratch, cci flow run dev_org, or cci org import)."
            )
        env["SF_TARGET_ORG"] = alias
        for key in ("SF_ACCESS_TOKEN", "SF_ORG_INSTANCE_URL", "SF_INSTANCE_URL"):
            env.pop(key, None)
        return env
