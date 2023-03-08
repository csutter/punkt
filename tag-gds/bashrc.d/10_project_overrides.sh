# Set root directory for GOV.UK-related repositories (used by `govuk-docker`)
export GOVUK_ROOT_DIR=$HOME/Developer/govuk

# Add `govuk-docker` bin to path
pathmunge "$GOVUK_ROOT_DIR/govuk-docker/exe"

# Aliases
alias govd="govuk-docker"
alias govdr="govuk-docker-run"
alias govdu="govuk-docker-up"
