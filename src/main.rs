use clap::Parser;
use example_rust_project::Cli;

fn main() {
    let cli = Cli::parse();

    dbg!(cli);
}
