# Set root directory for GOV.UK-related repositories (used by `govuk-docker`)
export GOVUK_ROOT_DIR=$HOME/Developer/govuk

# Add `govuk-docker` bin to path
pathmunge "$GOVUK_ROOT_DIR/govuk-docker/exe"

# Aliases
alias govd="govuk-docker"
alias govdr="govuk-docker-run"
alias govdu="govuk-docker-up"

# Jump to govuk directory
function dg() {
  cd "$HOME/Developer/govuk/$1"
}
[ -d $HOME/Developer/govuk ] && complete -W "$(ls $HOME/Developer/govuk)" dg

# Discovery engine configuration:
export DISCOVERY_ENGINE_DATASTORE="projects/search-api-v2-dev/locations/global/collections/default_collection/dataStores/local-cs"
