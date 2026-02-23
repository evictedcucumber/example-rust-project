use clap::Parser;
use example_rust_project::Cli;

fn main() {
    let cli = Cli::parse();

    println!("Hello {}", cli.name);
}
