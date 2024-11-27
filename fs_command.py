import os
import argparse

def create_mmvc_structure(folder_name):
    base_dir = os.getcwd()
    product_dir = os.path.join(base_dir, folder_name)
    data_dir = os.path.join(product_dir, "data")
    domain_dir = os.path.join(product_dir, "domain")
    presentation_dir = os.path.join(product_dir, "presentation")
    screens_dir = os.path.join(presentation_dir, "screens")
    view_model_dir = os.path.join(presentation_dir, "view_model")
    widgets_dir = os.path.join(presentation_dir, "widgets")

    os.makedirs(data_dir, exist_ok=True)
    os.makedirs(os.path.join(data_dir, "datasource"), exist_ok=True)
    os.makedirs(os.path.join(data_dir, "repositories"), exist_ok=True)
    os.makedirs(domain_dir, exist_ok=True)
    os.makedirs(screens_dir)
    os.makedirs(view_model_dir)
    os.makedirs(widgets_dir)

    # Create the [parent_folder]_local_datasource.dart file inside the data/datasource directory
    with open(os.path.join(data_dir, "datasource", f"{os.path.basename(product_dir)}_local_datasource.dart"), "w") as f:
        f.write("# [parent_folder] local datasource file")

    # Create the [parent_folder]_remote_datasource.dart file inside the data/datasource directory
    with open(os.path.join(data_dir, "datasource", f"{os.path.basename(product_dir)}_remote_datasource.dart"), "w") as f:
        f.write("# [parent_folder] remote datasource file")

    # Create the [parent_folder]_repository.dart file inside the data/repositories directory
    with open(os.path.join(data_dir, "repositories", f"{os.path.basename(product_dir)}_repository.dart"), "w") as f:
        f.write("# [parent_folder] repository file")
        
    # Create the [parent_folder]_view_model.dart file inside the presentation/view_model directory
    with open(os.path.join(view_model_dir, f"{os.path.basename(product_dir)}_view_model.dart"), "w") as f:
        f.write("# [parent_folder] view model file")

def main():
    parser = argparse.ArgumentParser(description="Create folder structure")
    parser.add_argument("folder_name", help="Name of the folder to create")
    args = parser.parse_args()

    create_mmvc_structure(args.folder_name)

if __name__ == "__main__":
    main()
