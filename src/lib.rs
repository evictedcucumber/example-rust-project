use clap::Parser;

#[derive(Parser, Debug)]
#[command(version,about, long_about = None)]
pub struct Cli {
    pub name: String,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn cli_debug_assert() {
        use clap::CommandFactory;

        Cli::command().debug_assert();
    }
}
