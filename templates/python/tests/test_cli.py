from typer.testing import CliRunner

from __PYTHON_PACKAGE__.cli import app


def test_run_server_outputs_listen_address() -> None:
    runner = CliRunner()

    result = runner.invoke(app, ["run-server"])

    assert result.exit_code == 0
    assert "listening on http://" in result.stdout
